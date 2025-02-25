import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  static String routeName = 'LoginPage';
  static String routePath = 'login';

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Zaloguj się do panelu (Luncher - Admin)',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 350.0,
                ),
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: TextFormField(
                        controller: _model.emailTextController,
                        focusNode: _model.emailFocusNode,
                        autofocus: true,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Adres email',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                        keyboardType: TextInputType.emailAddress,
                        validator: _model.emailTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 35.0),
                      child: TextFormField(
                        controller: _model.passwordTextController,
                        focusNode: _model.passwordFocusNode,
                        autofocus: true,
                        textInputAction: TextInputAction.done,
                        obscureText: !_model.passwordVisibility,
                        decoration: InputDecoration(
                          labelText: 'Hasło',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          suffixIcon: InkWell(
                            onTap: () => safeSetState(
                              () => _model.passwordVisibility =
                                  !_model.passwordVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _model.passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              size: 20.0,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                        validator: _model.passwordTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        var _shouldSetState = false;
                        Function() _navigate = () {};
                        // login call
                        _model.authResult =
                            await LuncherCoreAPIPOSTAuthLoginGroup.loginCall
                                .call(
                          email: _model.emailTextController.text,
                          password: _model.passwordTextController.text,
                        );

                        _shouldSetState = true;
                        if ((_model.authResult?.succeeded ?? true)) {
                          // Pobranie user info
                          _model.profileOutput =
                              await LuncherCoreAPIGETProfileGroup.getProfileCall
                                  .call(
                            authorization: LuncherCoreAPIPOSTAuthLoginGroup
                                .loginCall
                                .accessToken(
                              (_model.authResult?.jsonBody ?? ''),
                            ),
                          );

                          _shouldSetState = true;
                          if ((_model.profileOutput?.succeeded ?? true)) {
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signIn(
                              authenticationToken:
                                  LuncherCoreAPIPOSTAuthLoginGroup.loginCall
                                      .accessToken(
                                (_model.authResult?.jsonBody ?? ''),
                              ),
                              tokenExpiration: dateTimeFromSecondsSinceEpoch(
                                  valueOrDefault<int>(
                                LuncherCoreAPIPOSTAuthLoginGroup.loginCall
                                    .tokenLifetime(
                                  (_model.authResult?.jsonBody ?? ''),
                                ),
                                0,
                              )),
                              authUid: UserStruct.maybeFromMap(
                                      (_model.profileOutput?.jsonBody ?? ''))
                                  ?.uuid,
                              userData: UserStruct.maybeFromMap(
                                  (_model.profileOutput?.jsonBody ?? '')),
                            );
                            _navigate = () => context.goNamedAuth(
                                HomePageWidget.routeName, context.mounted);

                            _navigate();
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Nieprawidłowe dane logowania, spróbuj ponownie!',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Nieprawidłowe dane logowania, spróbuj ponownie!',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).error,
                            ),
                          );
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }

                        _navigate();
                        if (_shouldSetState) safeSetState(() {});
                      },
                      text: 'Zaloguj się',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
