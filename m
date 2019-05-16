From: Juergen Gross <jgross@suse.com>
Subject: Re: Regression in xen-unstable due to commit
 3802ecbaa9eb36
Date: Thu, 16 May 2019 10:34:05 +0200
Message-ID: <50ea0819-2fc1-44a1-1dfc-fe5b1a212f02@suse.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516102706.4766f2c3.ohering@suse.com>
 <20190516103033.115ad35d.ohering@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xQgL=TQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hRBq6-0002KQ-Hi
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 08:34:10 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9F91BAE27
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 08:34:06 +0000 (UTC)
In-Reply-To: <20190516103033.115ad35d.ohering@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <ohering@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDUvMjAxOSAxMDozMCwgT2xhZiBIZXJpbmcgd3JvdGU6Cj4gQW0gVGh1LCAxNiBNYXkg
MjAxOSAxMDoyNzowNiArMDIwMAo+IHNjaHJpZWIgT2xhZiBIZXJpbmcgPG9oZXJpbmdAc3VzZS5j
b20+Ogo+IAo+PiBBbSBUaHUsIDE2IE1heSAyMDE5IDEwOjA5OjM4ICswMjAwCj4+IHNjaHJpZWIg
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPjoKPj4+IEhhcyB0aGlzIHBhdGNoIGV2ZXIg
YmVlbiB0ZXN0ZWQgdG8gd29yaz8gIAo+PiBXaXRoIFBWIG9ubHkuIEkgd2lsbCBoYXZlIGEgbG9v
ay4KPiAKPiBJdCBoYXBwZW5zIHRvIHdvcmsgZm9yIG1lOgo+IHhlbl9jaGFuZ2VzZXQgICAgICAg
ICAgOiAyMDE5LTA1LTE1IDE2OjE5OjU3ICswMTAwIGdpdDoyYTU1NmI2M2EyCj4gCj4gRG9tYWlu
LTAKPiBwdl9zbGUxMnNwMl9jX3Fjb3cyCj4gcHZfc2xlMTJzcDJfY19yYXcKPiBmdl9zbGUxMnNw
Ml9jX3Jhdwo+IGZ2X3NsZTEyc3AyX2NfcWNvdzIKPiAKPiBNYXliZSBJIG1pc3VuZGVyc3RhbmQg
YXNzZXJ0PyBJIHRoaW5rIHRoZSBwb2ludCBpcyB0aGF0IHRoZSBtZW1iZXIgaXMgbm90IHplcm8u
CgpIbW0sIHJldmVydGluZyB5b3VyIHBhdGNoZXMgbWFrZXMgaXQgd29yayBmb3IgbWUgYWdhaW4u
CgpNeSBkb21haW4gY29uZmlnOgoKbmFtZT0ic2xlczEyc3AyIgpkZXNjcmlwdGlvbj0iTm9uZSIK
dXVpZD0iYzU5YTVjZjQtZGM0MS0xNjJiLThhZTAtODMxNzRmNmQ4N2ViIgptZW1vcnk9MjA0OApt
YXhtZW09MjA0OAp2Y3B1cz0xCm1heHZjcHVzPTQKb25fcG93ZXJvZmY9ImRlc3Ryb3kiCm9uX3Jl
Ym9vdD0icmVzdGFydCIKb25fY3Jhc2g9ImRlc3Ryb3kiCmxvY2FsdGltZT0wCmtleW1hcD0iZW4t
dXMiCnR5cGU9InB2Igpjb25zb2xlPXR0eTAgeGVuLWZiZnJvbnQudmlkZW89MzIsMTAyNCw3Njgi
Cmtlcm5lbD0iL3Vzci9saWIvZ3J1YjIveDg2XzY0LXhlbi9ncnViLnhlbiIKZGlzaz1bICcvaG9t
ZS92bS9pbWFnZXMvc2xlczEyc3AyLHJhdyx4dmRhLHcsYmFja2VuZHR5cGU9cWRpc2snLCBdCnZp
Zj1bICdtYWM9MDA6MTY6M2U6MmE6OWU6ODcsYnJpZGdlPWJyMCcsIF0Kbm9ncmFwaGljPTEKCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
