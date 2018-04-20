From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/HVM: never retain emulated insn cache
 when exiting back to guest
Date: Fri, 20 Apr 2018 16:21:21 +0200
Message-ID: <702dc9bd-9bc1-9009-5057-01112a25469a@suse.com>
References: <5AD9F6F102000078001BD0C8@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=7tp6=hj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f9Wuh-0006ns-TM
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 14:21:23 +0000
In-Reply-To: <5AD9F6F102000078001BD0C8@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDQvMTggMTY6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+IENvbW1pdCA1ZmNiMjZlNjll
ICgieDg2L0hWTTogZG9uJ3QgcmV0YWluIGVtdWxhdGVkIGluc24gY2FjaGUgd2hlbgo+IGV4aXRp
bmcgYmFjayB0byBndWVzdCIpIGRpZG4ndCBnbyBxdWl0ZSBmYXIgZW5vdWdoOiBUaGUgaW5zbiBl
bXVsYXRvcgo+IG1heSBpdHNlbGYgZGVjaWRlIHRvIHJldHVybiBYODZFTVVMX1JFVFJZIChjdXJy
ZW50bHkgZm9yIGNlcnRhaW4KPiBDTVBYQ0hHIGZhaWx1cmVzIGFuZCBBVlgyIGdhdGhlciBpbnNu
cyksIGluIHdoaWNoIGNhc2Ugd2UnZCBhbHNvIGV4aXQKPiBiYWNrIHRvIGd1ZXN0IGNvbnRleHQu
IFRpZSB0aGUgY2FjaGluZyB0byB3aGV0aGVyIHdlIGhhdmUgYW4gSS9PCj4gY29tcGxldGlvbiBw
ZW5kaW5nLCBpbnN0ZWFkIG9mIHg4Nl9lbXVsYXRlKCkncyByZXR1cm4gdmFsdWUuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmVsZWFzZS1hY2tl
ZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
