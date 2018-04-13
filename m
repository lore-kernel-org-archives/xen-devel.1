From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH RFC 7/8] mm: allow to control
 onlining/offlining of memory by a driver
Date: Fri, 13 Apr 2018 17:59:43 +0200
Message-ID: <20180413155943.GY17484__37179.3680861176$1523635110$gmane$org@dhcp22.suse.cz>
References: <20180413131632.1413-1-david@redhat.com>
 <20180413133334.3612-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=8rna=hc=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1f7177-0001Kz-G5
 for xen-devel@lists.xenproject.org; Fri, 13 Apr 2018 15:59:49 +0000
Content-Disposition: inline
In-Reply-To: <20180413133334.3612-1-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, open list <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, Reza Arbab <arbab@linux.vnet.ibm.com>, Ingo Molnar <mingo@kernel.org>, linux-mm@kvack.org, Thomas Gleixner <tglx@linutronix.de>, "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpIDEzLTA0LTE4IDE1OjMzOjI4LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiBTb21l
IGRldmljZXMgKGVzcC4gcGFyYXZpcnR1YWxpemVkKSBtaWdodCB3YW50IHRvIGNvbnRyb2wKPiAt
IHdoZW4gdG8gb25saW5lL29mZmxpbmUgYSBtZW1vcnkgYmxvY2sKPiAtIGhvdyB0byBvbmxpbmUg
bWVtb3J5IChNT1ZBQkxFL05PUk1BTCkKPiAtIGluIHdoaWNoIGdyYW51bGFyaXR5IHRvIG9ubGlu
ZS9vZmZsaW5lIG1lbW9yeQo+IAo+IFNvIGxldCdzIGFkZCBhIG5ldyBmbGFnICJkcml2ZXJfbWFu
YWdlZCIgYW5kIGRpc2FsbG93IHRvIGNoYW5nZSB0aGUKPiBzdGF0ZSBieSB1c2VyIHNwYWNlLiBE
ZXZpY2Ugb25saW5pbmcvb2ZmbGluaW5nIHdpbGwgc3RpbGwgd29yaywgaG93ZXZlcgo+IHRoZSBt
ZW1vcnkgd2lsbCBub3QgYmUgYWN0dWFsbHkgb25saW5lZC9vZmZsaW5lZC4gVGhhdCBoYXMgdG8g
YmUgaGFuZGxlZAo+IGJ5IHRoZSBkZXZpY2UgZHJpdmVyIHRoYXQgb3ducyB0aGUgbWVtb3J5LgoK
SXMgdGhlcmUgYW55IHJlYXNvbiB0byBjcmVhdGUgdGhlIG1lbWJsb2NrIHN5c2ZzIGludGVyZmFj
ZSB0byB0aGlzCm1lbW9yeSBhdCBhbGw/IFpPTkVfREVWSUNFIG1lbSBob3RwbHVnIHVzZXJzIGN1
cnJlbnRseSBkbyBub3QgZG8gdGhhdAphbmQgbWFuYWdlIHRoZSBtZW1vcnkgdGhlbXNlbHZlcy4g
SXQgc2VlbXMgeW91IHdhbnQgdG8gYWNoaWV2ZSB0aGUgc2FtZQp0aGluZywgbm8/Ci0tIApNaWNo
YWwgSG9ja28KU1VTRSBMYWJzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
