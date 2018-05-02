From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 3/4] xen/PVH: Set up GS segment for stack
 canary
Date: Wed, 2 May 2018 11:00:30 -0400
Message-ID: <615b0e30-c360-3ad4-f1b3-0e907d790643__20137.6053541482$1525272990$gmane$org@oracle.com>
References: <20180430162339.17143-1-boris.ostrovsky@oracle.com>
 <20180430162339.17143-4-boris.ostrovsky@oracle.com>
 <5AE973CD02000078001C008E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rpbp=hv=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fDtCU-0006ef-VT
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 14:57:46 +0000
In-Reply-To: <5AE973CD02000078001C008E@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDIvMjAxOCAwNDoxNiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzAuMDQu
MTggYXQgMTg6MjMsIDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+IC0tLSBh
L2FyY2gveDg2L3hlbi94ZW4tcHZoLlMKPj4gKysrIGIvYXJjaC94ODYveGVuL3hlbi1wdmguUwo+
PiBAQCAtNTQsNiArNTQsOSBAQAo+PiAgICogY2hhcmdlIG9mIHNldHRpbmcgdXAgaXQncyBvd24g
c3RhY2ssIEdEVCBhbmQgSURULgo+PiAgICovCj4+ICAKPj4gKyNkZWZpbmUgUFZIX0dEVF9FTlRS
WV9DQU5BUlkgICAgNAo+PiArI2RlZmluZSBQVkhfQ0FOQVJZX1NFTCAgICAgICAgICAoUFZIX0dE
VF9FTlRSWV9DQU5BUlkgKiA4KQo+IEkgY2FuIG9ubHkgYWR2aXNlIGFnYWluc3QgZG9pbmcgaXQg
dGhpcyB3YXk6IFRoZXJlJ3Mgbm8gc2FmZWd1YXJkIGFnYWluc3QKPiBzb21lb25lIGNoYW5naW5n
IGFzbS9zZWdtZW50Lmggd2l0aG91dCBjaGFuZ2luZyB0aGlzIHZhbHVlIChpbiBmYWN0Cj4gdGhp
cyBhcHBsaWVzIHRvIGFsbCBvZiB0aGUgR0RUIHNlbGVjdG9ycyBwb3B1bGF0ZWQgaW4gdGhpcyBm
aWxlKS4gQXQgdGhlIHZlcnkKPiBsZWFzdCB0aWUgdGhpcyB0byBHRFRfRU5UUllfQk9PVF9UU1Mg
LyBfX0JPT1RfVFNTPwo+Cj4+IEBAIC02NCw2ICs2Nyw5IEBAIEVOVFJZKHB2aF9zdGFydF94ZW4p
Cj4+ICAJbW92ICVlYXgsJWVzCj4+ICAJbW92ICVlYXgsJXNzCj4+ICAKPj4gKwltb3YgJChQVkhf
Q0FOQVJZX1NFTCksJWVheAo+PiArCW1vdiAlZWF4LCVncwo+PiArCj4+ICAJLyogU3Rhc2ggaHZt
X3N0YXJ0X2luZm8uICovCj4+ICAJbW92ICRfcGEocHZoX3N0YXJ0X2luZm8pLCAlZWRpCj4+ICAJ
bW92ICVlYngsICVlc2kKPj4gQEAgLTE1MCw2ICsxNTYsNyBAQCBnZHRfc3RhcnQ6Cj4+ICAJLnF1
YWQgMHgwMGNmOWEwMDAwMDBmZmZmICAgICAgICAgICAgLyogX19CT09UX0NTICovCj4+ICAjZW5k
aWYKPj4gIAkucXVhZCAweDAwY2Y5MjAwMDAwMGZmZmYgICAgICAgICAgICAvKiBfX0JPT1RfRFMg
Ki8KPj4gKwkucXVhZCAweDAwNDA5MDAwMDAwMDAwMTggICAgICAgICAgICAvKiBQVkhfQ0FOQVJZ
X1NFTCAqLwo+IFdpdGhvdXQgYW55IGZ1cnRoZXIgY29kZSBiZWZvcmUgbG9hZGluZyB0aGUgc2Vs
ZWN0b3IsIHRoaXMgcG9pbnRzIGF0Cj4gcGh5c2ljYWwgYWRkcmVzcyAwLiBEb24ndCB5b3UgbmVl
ZCB0byBhZGQgaW4gdGhlIGJhc2UgYWRkcmVzcyBvZgo+IHRoZSBwZXItQ1BVIHN0YWNrX2NhbmFy
eT8KClRoaXMgR0RUIGlzIGdvbmUgc29vbiBhZnRlciB3ZSBqdW1wIGludG8gZ2VuZXJpYyB4ODYg
c3RhcnR1cCBjb2RlLlRoYXQKY29kZSB3aWxsIGxvYWQgaXRzIG93biBHRFQgKGFuZCB0aGVuIHNl
dCB1cCBwZXItY3B1IHNlZ21lbnRzIGFuZCBhbGwgdGhhdCkuCgotYm9yaXMKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
