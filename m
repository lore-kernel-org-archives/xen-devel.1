From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v5 1/2] memory_hotplug: Free pages as higher
 order
Date: Tue, 9 Oct 2018 13:06:49 +0200
Message-ID: <20181009110649.GJ8528__43731.1164140285$1539083112$gmane$org@dhcp22.suse.cz>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
 <20181009092938.GH8528@dhcp22.suse.cz>
 <9b56e156b911e943eba3a1daa0a1cb31@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mbow=mv=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1g9pqo-0008MQ-Tq
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 11:06:54 +0000
Content-Disposition: inline
In-Reply-To: <9b56e156b911e943eba3a1daa0a1cb31@codeaurora.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arun KS <arunks@codeaurora.org>
Cc: vatsa@codeaurora.org, linux-mm@kvack.org, getarunks@gmail.com, kys@microsoft.com, boris.ostrovsky@oracle.com, sthemmin@microsoft.com, xen-devel@lists.xenproject.org, haiyangz@microsoft.com, yasu.isimatu@gmail.com, dan.j.williams@intel.com, akpm@linux-foundation.org, vbabka@suse.cz, osalvador@suse.de, jgross@suse.com, aaron.lu@intel.com, malat@debian.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vinmenon@codeaurora.org, jrdr.linux@gmail.com, devel@linuxdriverproject.org, iamjoonsoo.kim@lge.com, mgorman@techsingularity.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlIDA5LTEwLTE4IDE1OjI0OjEzLCBBcnVuIEtTIHdyb3RlOgo+IE9uIDIwMTgtMTAtMDkg
MTQ6NTksIE1pY2hhbCBIb2NrbyB3cm90ZToKPiA+IE9uIEZyaSAwNS0xMC0xOCAxMzo0MDowNSwg
QXJ1biBLUyB3cm90ZToKPiA+ID4gV2hlbiBmcmVlIHBhZ2VzIGFyZSBkb25lIHdpdGggaGlnaGVy
IG9yZGVyLCB0aW1lIHNwZW5kIG9uCj4gPiA+IGNvYWxlc2NpbmcgcGFnZXMgYnkgYnVkZHkgYWxs
b2NhdG9yIGNhbiBiZSByZWR1Y2VkLiBXaXRoCj4gPiA+IHNlY3Rpb24gc2l6ZSBvZiAyNTZNQiwg
aG90IGFkZCBsYXRlbmN5IG9mIGEgc2luZ2xlIHNlY3Rpb24KPiA+ID4gc2hvd3MgaW1wcm92ZW1l
bnQgZnJvbSA1MC02MCBtcyB0byBsZXNzIHRoYW4gMSBtcywgaGVuY2UKPiA+ID4gaW1wcm92aW5n
IHRoZSBob3QgYWRkIGxhdGVuY3kgYnkgNjAlLiBNb2RpZnkgZXh0ZXJuYWwKPiA+ID4gcHJvdmlk
ZXJzIG9mIG9ubGluZSBjYWxsYmFjayB0byBhbGlnbiB3aXRoIHRoZSBjaGFuZ2UuCj4gPiAKPiA+
IEFja2VkLWJ5OiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KPiA+IAo+ID4gVGhhbmtz
IGZvciB5b3VyIHBhdGllbmNlIHdpdGggYWxsIHRoZSByZXN1Ym1pc3Npb24uCj4gCj4gSGVsbG8g
TWljaGFsLAo+IAo+IEkgZ290IHRoZSBiZWxvdyBlbWFpbCBmZXcgZGF5cyBiYWNrLiBEbyBJIHN0
aWxsIG5lZWQgdG8gcmVzdWJtaXQgdGhlIHBhdGNoPwo+IG9yIGlzIGl0IGFscmVhZHkgb24gdGhl
IHdheSB0byBtZXJnZT8KCkl0IGlzIHNpdHRpbmcgaW4gdGhlIHF1ZXVlIGZvciBub3cuIEFuZHJl
dyBjb2xsZWN0cyBhY2tzIGFuZApyZXZpZXdlZC1ieXMgYW5kIGFkZCB0aGVtIHRvIHRoZSBwYXRj
aC4KLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
