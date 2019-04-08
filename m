From: "=?gb18030?B?amluY2hlbg==?=" <jinchen1227@qq.com>
Subject: Xen ARM dom0less use PV drivers
Date: Mon, 8 Apr 2019 10:17:10 +0800
Message-ID: <tencent_DA6EA655E660F6F60C353F2674306A989F0A@qq.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9096935334659125961=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DryA=SK=qq.com=jinchen1227@srs-us1.protection.inumbo.net>)
 id 1hDJqp-0006oM-Kj
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 02:17:36 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?gb18030?B?eGVuLWRldmVs?= <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.

--===============9096935334659125961==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5CAAAF26_0AD973C8_78685994"
Content-Transfer-Encoding: 8Bit

This is a multi-part message in MIME format.

------=_NextPart_5CAAAF26_0AD973C8_78685994
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGVsbG8gZXhwZXJ0czoNCiAgICBUaGUgeGVuIDQuMTIgc3VwcG9ydCB0aGUgRG9tMGxlc3Mg
Vk0gdGhhdCBzdGFydCBkb211IGZyb20geGVuIG5vdCB4bCwgYnV0IHRoZSBQViBkcml2ZXJz
IGhhc24ndCBiZWVuIHN1cHBvcnRlZC4NCiAgICAgRG8geW91IGhhdmUgc29tZSBndWlkYW5j
ZSBmb3IgaG93IHRvIGVuYWJsZSBQViBkcml2ZXJzIHdoZW4gdXNpbmcgZG9tMGxlc3M/IA0K
ICAgIER1ZSB0byBrZXJuZWwgdXNlIHhlbmJ1cyBhbmQgeGVuc3RvcmUgdG8gcHJvYmUgUFYg
ZHJpdmVycywgdGhlc2UgbWVjaGFuaXNtIHNob3VsZCByZW1haW4gZm9yIGNvbXBhdGliaWxp
dHk/DQogICAgUmVtb3ZhbCB0aGUgeGVuc3RvcmUgbWVjaGFuaXNtIHRvIHhlbiBpbnRlcm5h
bCBvciBzb21lIG90aGVyIHdheT8NCiAgICBUaGFuayB5b3UgdmVyeSBtdWNoo6E=

------=_NextPart_5CAAAF26_0AD973C8_78685994
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PGRpdj5IZWxsbyBleHBlcnRzOjwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyBUaGUgeGVuIDQu
MTIgc3VwcG9ydCB0aGUmbmJzcDs8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IHNhbnMtc2Vy
aWY7IGZvbnQtc2l6ZTogMTIuN3B4OyI+RG9tMGxlc3MgVk0gdGhhdCBzdGFydCBkb211IGZy
b20geGVuIG5vdCB4bCwgYnV0IHRoZSBQViBkcml2ZXJzIGhhc24ndCBiZWVuIHN1cHBvcnRl
ZC48L3NwYW4+PC9kaXY+PGRpdj48Zm9udCBmYWNlPSJzYW5zLXNlcmlmIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOiAxMi43cHg7Ij4mbmJzcDsgJm5ic3A7ICZuYnNwOzwvc3Bhbj48L2Zv
bnQ+RG8geW91IGhhdmUgc29tZSBndWlkYW5jZSBmb3IgaG93IHRvIGVuYWJsZSBQViBkcml2
ZXJzIHdoZW4gdXNpbmcgZG9tMGxlc3M/Jm5ic3A7PC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7
IER1ZSB0byBrZXJuZWwgdXNlIHhlbmJ1cyBhbmQgeGVuc3RvcmUgdG8gcHJvYmUgUFYgZHJp
dmVycywgdGhlc2UgbWVjaGFuaXNtIHNob3VsZCZuYnNwO3JlbWFpbiBmb3IgY29tcGF0aWJp
bGl0eT88L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgUmVtb3ZhbCB0aGUgeGVuc3RvcmUgbWVj
aGFuaXNtIHRvIHhlbiBpbnRlcm5hbCBvciBzb21lIG90aGVyIHdheT88L2Rpdj48ZGl2PiZu
YnNwOyAmbmJzcDsgVGhhbmsgeW91IHZlcnkgbXVjaKOhPC9kaXY+

------=_NextPart_5CAAAF26_0AD973C8_78685994--





--===============9096935334659125961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9096935334659125961==--
