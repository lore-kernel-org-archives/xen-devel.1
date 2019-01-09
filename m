From: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] tmem: default to off
Date: Wed, 9 Jan 2019 15:02:50 +0000
Message-ID: <1547046169812.74855@citrix.com>
References: <5C35B94F020000780020BB36@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sDH9=PR=citrix.com=prvs=90533d348=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ghFOE-0000Lc-NQ
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 15:03:30 +0000
In-Reply-To: <5C35B94F020000780020BB36@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

ClNvcnJ5IGZvciB0aGUgd3JvbmcgZm9ybWF0dGluZy4KCkZyb206IFhlbi1kZXZlbCA8eGVuLWRl
dmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IG9uIGJlaGFsZiBvZiBKYW4gQmV1bGlj
aCA8SkJldWxpY2hAc3VzZS5jb20+OgotLS0gYS94ZW4vY29tbW9uL01ha2VmaWxlCisrKyBiL3hl
bi9jb21tb24vTWFrZWZpbGUKQEAgLTIxLDcgKzIxLDcgQEAgb2JqLSQoQ09ORklHX0tFWEVDKSAr
PSBraW1hZ2Uubwogb2JqLXkgKz0gbGliLm8KIG9iai0kKENPTkZJR19ORUVEU19MSVNUX1NPUlQp
ICs9IGxpc3Rfc29ydC5vCiBvYmotJChDT05GSUdfTElWRVBBVENIKSArPSBsaXZlcGF0Y2gubyBs
aXZlcGF0Y2hfZWxmLm8KLW9iai15ICs9IGx6by5vCitvYmotJChDT05GSUdfVE1FTSkgKz0gbHpv
Lm8KCkhlcmUgeW91IGNvbXBsZXRlbHkgZGlzYWJsZSB0aGUgYnVpbGQgb2YgbHpvIGlmIHRtZW0g
aXMgbm90IGVuYWJsZWQuCgogb2JqLSQoQ09ORklHX01FTV9BQ0NFU1MpICs9IG1lbV9hY2Nlc3Mu
bwogb2JqLXkgKz0gbWVtb3J5Lm8KIG9iai15ICs9IG1vbml0b3IubwpAQCAtNjYsOCArNjYsOSBA
QCBvYmotYmluLXkgKz0gd2FybmluZy5pbml0Lm8KIG9iai0kKENPTkZJR19YRU5PUFJPRikgKz0g
eGVub3Byb2Yubwogb2JqLXkgKz0geG1hbGxvY190bHNmLm8KCi1vYmotYmluLSQoQ09ORklHX1g4
NikgKz0gJChmb3JlYWNoIG4sZGVjb21wcmVzcyBidW56aXAyIHVueHogdW5sem1hIHVubHpvIHVu
bHo0IGVhcmx5Y3BpbywkKG4pLmluaXQubykKLQorbHpvLXkgOj0gbHpvCitsem8tJChDT05GSUdf
VE1FTSkgOj0KK29iai1iaW4tJChDT05GSUdfWDg2KSArPSAkKGZvcmVhY2ggbixkZWNvbXByZXNz
IGJ1bnppcDIgdW54eiB1bmx6bWEgJChsem8teSkgdW5sem8gdW5sejQgZWFybHljcGlvLCQobiku
aW5pdC5vKQoKSGVyZSBob3dldmVyIHlvdSBhbHdheXMgYnVpbGQgdW5sem8uYywgd2hpY2ggQUZB
SUNUIG1ha2VzIHVzZSBvZiB0aGUgbHpvMXhfZGVjb21wcmVzc19zYWZlIGZ1bmN0aW9uIHRoYXQn
cyBkZWZpbmVkIGluIGx6by5jLgoKVGhhbmtzLCBSb2dlci4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
