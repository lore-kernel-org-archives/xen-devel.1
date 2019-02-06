From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 for-4.12] arm: gic-v3: deactivate
 interrupts during initialization
Date: Wed, 6 Feb 2019 06:51:55 +0100
Message-ID: <d2b58be3-305c-0cc3-fcf9-2ca03a97f1c2@suse.com>
References: <20190205060437.29637-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8kDD=QN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1grG7s-00010Y-56
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 05:52:00 +0000
In-Reply-To: <20190205060437.29637-1-peng.fan@nxp.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peng Fan <peng.fan@nxp.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "julien.grall@arm.com" <julien.grall@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDIvMjAxOSAwNjo1NSwgUGVuZyBGYW4gd3JvdGU6Cj4gT24gaS5NWDgsIHdlIGltcGxl
bWVudGVkIHBhcnRpdGlvbiByZWJvb3Qgd2hpY2ggbWVhbnMgQ29ydGV4LUEgcmVib290Cj4gd2ls
bCBub3QgaW1wYWN0IE00IGNvcmVzIGFuZCBTeXN0ZW0gY29udHJvbCBVbml0IGNvcmUuIEhvd2V2
ZXIgR0lDdjMKPiBpcyBub3QgcmVzZXQgYmVjYXVzZSB3ZSBhbHNvIG5lZWQgdG8gc3VwcG9ydCBB
NzIgQ2x1c3RlciByZWJvb3Qgd2l0aG91dAo+IGFmZmVjdGluZyBBNTMgQ2x1c3Rlci4KPiAKPiBU
aGUgZ2ljLXYzIGNvbnRyb2xsZXIgaXMgY29uZmlndXJlZCB3aXRoIEVPSW1vZGUgdG8gMSwgc28g
ZHVyaW5nIHhlbgo+IHJlYm9vdCwgdGhlcmUgaXMgYSBmdW5jdGlvbiBjYWxsICJzbXBfY2FsbF9m
dW5jdGlvbihoYWx0X3RoaXNfY3B1LCBOVUxMLCAwKTsiCj4gLCBidXQgaGFsdF90aGlzX2NwdSBu
ZXZlciByZXR1cm4sIHRoYXQgbWVhbnMgb3RoZXIgQ1BVcyBoYXZlIG5vIGNoYW5jZSB0bwo+IGRl
YWN0aXZhdGUgdGhlIFNHSSBpbnRlcnJ1cHQsIGJlY2F1c2UgdGhlIGRlYWN0aXZhdGVfaXJxIG9w
ZXJhdGlvbiBpcyBhdAo+IHRoZSBlbmQgb2YgZG9fc2dpLiBEdXJpbmcgdGhlIG5leHQgYm9vdCBv
ZiBYZW4sIENQVTAgd2lsbCBpc3N1ZQo+IEdJQ19TR0lfQ0FMTF9GVU5DVElPTiB0byBvdGhlciBD
UFVzLiBBcyB0aGUgQWN0aXZlIHN0YXRlIGZvciBTR0kgaXMgbGVmdAo+IHVudG91Y2hlZCBkdXJp
bmcgdGhlIHJlYm9vdCwgdGhlIEdJQ19TR0lfQ0FMTF9GVU5DVElPTiB3aWxsIHN0aWxsIGJlIGFj
dGl2ZQo+IG9uIHRoZSBub24tYm9vdCBDUFVzLiBUaGlzIG1lYW5zIHRoZSBpbnRlcnJ1cHQgY2Fu
bm90IGJlIHRyaWdnZXJlZCBhZ2Fpbgo+IHVudGlsIGl0IGdldCBkZWFjdGl2YXRlZC4KPiAKPiBB
bmQgYWNjb3JkaW5nIHRvIElISTAwNjlEX2dpY19hcmNoaXRlY3R1cmVfc3BlY2lmaWNhdGlvbiwg
Y2hhcHRlcgo+ICI4LjExLjMgR0lDUl9JQ0FDVElWRVIwLCBJbnRlcnJ1cHQgQ2xlYXItQWN0aXZl
IFJlZ2lzdGVyIDAiLCB0aGUgUlcKPiBmaWVsZCBvZiBHSUNSX0lDQUNUSVZFUjAgcmVzZXRzIHRv
IGEgdmFsdWUgdGhhdCBpcyBhcmNoaXRlY3R1cmFsbHkgVU5LTk9XTi4KPiBTbyBtYWtlIHN1cmUg
YWxsIGludGVycnVwdHMgYXJlIGRlYWN0aXZhdGVkIGF0IGR1cmluZyBpbml0aWFsaXphdGlvbiBi
eQo+IGNsZWFyaW5nIHRoZSBzdGF0ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVu
Zy5mYW5AbnhwLmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
