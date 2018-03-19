From: Doug Goldstein <cardoe@cardoe.com>
Subject: broken build: 448c03b3cbe14873ee637755a29ea26ee7ca9ef9
Date: Mon, 19 Mar 2018 14:04:17 -0500
Message-ID: <19dc3afa-fbe1-564c-8502-6ca2c4f1cfc7@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=jfu+=gj=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1ey04z-0005ef-9S
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 19:04:21 +0000
Received: by mail-yw0-x236.google.com with SMTP id r29so1972611ywa.12
 for <xen-devel@lists.xenproject.org>; Mon, 19 Mar 2018 12:04:20 -0700 (PDT)
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Y29tbWl0IDQ0OGMwM2IzY2JlMTQ4NzNlZTYzNzc1NWEyOWVhMjZlZTdjYTllZjkKQXV0aG9yOiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkRhdGU6ICAgTW9uIEZlYiAyNiAwOTo0Njox
MiAyMDE4ICswMTAwCgpUaGlzIGNvbW1pdCBicmVha3MgdGhlIGJ1aWxkIG9mIHFlbXUteGVuLXRy
YWRpdGlvbmFsIGZvcjoKClVidW50dSAxNC4wNDogaHR0cHM6Ly9naXRsYWIuY29tL2NhcmRvZS94
ZW4vLS9qb2JzLzU4MjY2MTcwClVidW50dSAxNi4wNDogaHR0cHM6Ly9naXRsYWIuY29tL2NhcmRv
ZS94ZW4vLS9qb2JzLzU4MjY2MTc0CgpBIHNob3J0IHNuaXBwZXQgb2YgdGhlIGZhaWx1cmUgaXM6
CgogIEFSICAgIGkzODYtZG0vbGlicWVtdS5hCiAgTElOSyAgaTM4Ni1kbS9xZW11LWRtCi9idWls
ZHMvY2FyZG9lL3hlbi90b29scy8uLi90b29scy94ZW5zdG9yZS9saWJ4ZW5zdG9yZS5zbzogdW5k
ZWZpbmVkCnJlZmVyZW5jZSB0byBgZGxzeW0nCmNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJuZWQg
MSBleGl0IHN0YXR1cwptYWtlWzVdOiAqKiogW3FlbXUtZG1dIEVycm9yIDEKbWFrZVs1XTogTGVh
dmluZyBkaXJlY3RvcnkKYC9idWlsZHMvY2FyZG9lL3hlbi90b29scy9xZW11LXhlbi10cmFkaXRp
b25hbC1kaXItcmVtb3RlL2kzODYtZG0nCm1ha2VbNF06ICoqKiBbc3ViZGlyLWkzODYtZG1dIEVy
cm9yIDIKbWFrZVs0XTogTGVhdmluZyBkaXJlY3RvcnkKYC9idWlsZHMvY2FyZG9lL3hlbi90b29s
cy9xZW11LXhlbi10cmFkaXRpb25hbC1kaXItcmVtb3RlJwptYWtlWzNdOiAqKiogW3N1YmRpci1h
bGwtcWVtdS14ZW4tdHJhZGl0aW9uYWwtZGlyXSBFcnJvciAyCm1ha2VbM106IExlYXZpbmcgZGly
ZWN0b3J5IGAvYnVpbGRzL2NhcmRvZS94ZW4vdG9vbHMnCm1ha2VbMl06ICoqKiBbc3ViZGlycy1p
bnN0YWxsXSBFcnJvciAyCm1ha2VbMl06IExlYXZpbmcgZGlyZWN0b3J5IGAvYnVpbGRzL2NhcmRv
ZS94ZW4vdG9vbHMnCm1ha2VbMV06ICoqKiBbaW5zdGFsbF0gRXJyb3IgMgptYWtlWzFdOiBMZWF2
aW5nIGRpcmVjdG9yeSBgL2J1aWxkcy9jYXJkb2UveGVuL3Rvb2xzJwptYWtlOiAqKiogW2luc3Rh
bGwtdG9vbHNdIEVycm9yIDIKCi0tIApEb3VnIEdvbGRzdGVpbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
