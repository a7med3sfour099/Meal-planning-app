import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/food_bg.jpg', fit: BoxFit.cover),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.15),
                  Colors.black.withOpacity(0.75),
                  Colors.black.withOpacity(0.9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.6, 1.0],
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Join Us ',
                        style: GoogleFonts.notoSans(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Text(
                        'Now',
                        style: GoogleFonts.notoSans(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),
                  Text(
                    'Start planning your meals today.',
                    style: GoogleFonts.notoSans(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Continue with Google (placeholder, no real auth)
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        // Placeholder only — no real Google authentication wired up.
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black87,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _GoogleIcon(),
                          const SizedBox(width: 10),
                          Text(
                            'Continue with Google',
                            style: GoogleFonts.notoSans(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Continue with Email -> Sign Up screen
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/signup');
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Continue with Email',
                        style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Continue as Guest -> Home (MainNavigation)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: Text(
                        'Continue as Guest',
                        style: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Simple placeholder "G" mark so we don't depend on an extra icon package/asset.
/// Swap this out for a real Google logo asset/icon whenever real Google
/// sign-in is wired up.
class _GoogleIcon extends StatelessWidget {
  const _GoogleIcon();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'G', style: GoogleFonts.notoSans(color: const Color(0xFF4285F4), fontWeight: FontWeight.bold, fontSize: 16)),
          TextSpan(text: 'o', style: GoogleFonts.notoSans(color: const Color(0xFFEA4335), fontWeight: FontWeight.bold, fontSize: 16)),
          TextSpan(text: 'o', style: GoogleFonts.notoSans(color: const Color(0xFFFBBC05), fontWeight: FontWeight.bold, fontSize: 16)),
          TextSpan(text: 'g', style: GoogleFonts.notoSans(color: const Color(0xFF4285F4), fontWeight: FontWeight.bold, fontSize: 16)),
          TextSpan(text: 'l', style: GoogleFonts.notoSans(color: const Color(0xFF34A853), fontWeight: FontWeight.bold, fontSize: 16)),
          TextSpan(text: 'e', style: GoogleFonts.notoSans(color: const Color(0xFFEA4335), fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}
