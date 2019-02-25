From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH L1TF v8 3/9] spec: add l1tf-barrier
Date: Mon, 25 Feb 2019 21:03:21 +0100
Message-ID: <a25fc8e9-bd21-cb4d-7ddd-3664ae4be0ef@suse.com>
References: <1551101683-996-1-git-send-email-nmanthey@amazon.de>
 <1551101683-996-4-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kH8z=RA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gyMUC-0000iR-Rw
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 20:04:24 +0000
In-Reply-To: <1551101683-996-4-git-send-email-nmanthey@amazon.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Norbert Manthey <nmanthey@amazon.de>, xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Pawel Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDIvMjAxOSAxNDozNCwgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+IFRvIGNvbnRyb2wg
dGhlIHJ1bnRpbWUgYmVoYXZpb3Igb24gTDFURiB2dWxuZXJhYmxlIHBsYXRmb3JtcyBiZXR0ZXIs
IHRoZQo+IGNvbW1hbmQgbGluZSBvcHRpb24gbDF0Zi1iYXJyaWVyIGlzIGludHJvZHVjZWQuIFRo
aXMgb3B0aW9uIGNvbnRyb2xzCj4gd2hldGhlciBvbiB2dWxuZXJhYmxlIHg4NiBwbGF0Zm9ybXMg
dGhlIGxmZW5jZSBpbnN0cnVjdGlvbiBpcyB1c2VkIHRvCj4gcHJldmVudCBzcGVjdWxhdGl2ZSBl
eGVjdXRpb24gZnJvbSBieXBhc3NpbmcgdGhlIGV2YWx1YXRpb24gb2YKPiBjb25kaXRpb25hbHMg
dGhhdCBhcmUgcHJvdGVjdGVkIHdpdGggdGhlIGV2YWx1YXRlX25vc3BlYyBtYWNyby4KPiAKPiBC
eSBub3csIFhlbiBpcyBjYXBhYmxlIG9mIGlkZW50aWZ5aW5nIEwxVEYgdnVsbmVyYWJsZSBoYXJk
d2FyZS4gSG93ZXZlciwKPiB0aGlzIGluZm9ybWF0aW9uIGNhbm5vdCBiZSB1c2VkIGZvciBhbHRl
cm5hdGl2ZSBwYXRjaGluZywgYXMgYSBDUFUgZmVhdHVyZQo+IGlzIHJlcXVpcmVkLiBUbyBjb250
cm9sIGFsdGVybmF0aXZlIHBhdGNoaW5nIHdpdGggdGhlIGNvbW1hbmQgbGluZSBvcHRpb24sCj4g
YSBuZXcgeDg2IGZlYXR1cmUgIlg4Nl9GRUFUVVJFX1NDX0wxVEZfVlVMTiIgaXMgaW50cm9kdWNl
ZC4gVGhpcyBmZWF0dXJlCj4gaXMgdXNlZCB0byBwYXRjaCB0aGUgbGZlbmNlIGluc3RydWN0aW9u
IGludG8gdGhlIGFyY2hfYmFycmllcl9ub3NwZWNfdHJ1ZQo+IGZ1bmN0aW9uLiBUaGUgZmVhdHVy
ZSBpcyBlbmFibGVkIG9ubHkgaWYgTDFURiB2dWxuZXJhYmxlIGhhcmR3YXJlIGlzCj4gZGV0ZWN0
ZWQgYW5kIHRoZSBjb21tYW5kIGxpbmUgb3B0aW9uIGRvZXMgbm90IHByZXZlbnQgdXNpbmcgdGhp
cyBmZWF0dXJlLgo+IAo+IFRoZSBzdGF0dXMgb2YgaHlwZXJ0aHJlYWRpbmcgaXMgY29uc2lkZXJl
ZCB3aGVuIGF1dG9tYXRpY2FsbHkgZW5hYmxpbmcKPiBhZGRpbmcgdGhlIGxmZW5jZSBpbnN0cnVj
dGlvbi4gU2luY2UgcGxhdGZvcm1zIHdpdGhvdXQgaHlwZXJ0aHJlYWRpbmcgY2FuCj4gc3RpbGwg
YmUgdnVsbmVyYWJsZSB0byBMMVRGIGluIGNhc2UgdGhlIEwxIGNhY2hlIGlzIG5vdCBmbHVzaGVk
IHByb3Blcmx5LAo+IHRoZSBhZGRpdGlvbmFsIGxmZW5jZSBpbnN0cnVjdGlvbnMgYXJlIHBhdGNo
ZWQgaW4gaWYgZWl0aGVyIGh5cGVydGhyZWFkaW5nCj4gaXMgZW5hYmxlZCwgb3IgTDEgY2FjaGUg
Zmx1c2hpbmcgaXMgbWlzc2luZy4KPiAKPiBUaGlzIGlzIHBhcnQgb2YgdGhlIHNwZWN1bGF0aXZl
IGhhcmRlbmluZyBlZmZvcnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTm9yYmVydCBNYW50aGV5IDxu
bWFudGhleUBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
