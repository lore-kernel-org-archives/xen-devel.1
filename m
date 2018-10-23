From: Dag Nygren <dag@newtech.fi>
Subject: Bug report: vtpmmgr TPM 2.0 implementation
Date: Tue, 23 Oct 2018 10:17:08 +0300
Message-ID: <8285393.eUs1EhXEQl@eseries.newtech.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=yyfm=nd=newtech.fi=dag@srs-us1.protection.inumbo.net>)
 id 1gEqwC-00054Q-HF
 for xen-devel@lists.xenproject.org; Tue, 23 Oct 2018 07:17:12 +0000
Received: from eseries.newtech.fi (eseries.newtech.fi [194.110.87.243])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 by mail.newtech.fi (Postfix) with ESMTPSA id 6904C661DE
 for <xen-devel@lists.xenproject.org>; Tue, 23 Oct 2018 10:17:08 +0300 (EEST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsIQoKQWZ0ZXIgYSBsb3Qgb2Ygc3RydWdnbGUgSSBjYW4gbm93IHJlcG9ydCBhIHByZXR0
eSBzZXJpb3VzIGJ1ZyBpbgp0aGUgdnRwbW1nciAyLjAgaW1wbGVtZW50YXRpb246CgotIFRvIG1h
a2UgYSB0aGUgVlRQTSBjb250ZW50cyBwZXJtZW5lbnQsIHN1cnZpdmluZyBhIHJlYm9vdAogIHlv
dSBoYXZlIHRvIHNlYWwgdGhlIGNvbnRlbnRzIHVzaW5nIHRoZSBQZWFybCBzY3JpcHRzIGluIHRo
ZQogIHNvdXJjZSBkaXJlY3RvcnkgY2FsYy5wbCBhbmQgbWFuYWdlLXZ0cG1tZ3IucGwKLSBJZiB5
b3UgYXJlIHVzaW5nIGEgVFBNIDIuMCBIVyBUUE0gdGhlc2Ugc2VhbCBvcGVyYXRpb25zCiAgd2ls
bCBzdGlsbCB0cnkgdG8gdXNlIFRQTSAxLjIgY29tbWFuZHMgZm9yIHRoZSBzZWFsIGFuZAogIGl0
IHdpbGwgZmFpbAoKSW4gb3RoZXIgd29yZHMgeW91IGFyZSBub3QgYWJsZSB0byBjcmVhdGUgYSB2
dHBtL3Z0cG1tZ3IgY29uZmlnIHRoYXQKc3Vydml2ZXMgYSByZWJvb3QgaWYgeW91ciBIVyBpcyBk
b2luZyBUUE0gMi4wCgpBIHNob3dzdG9wcGVyIGZvciB1cy4uCgpCZXN0CkRhZwoKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
