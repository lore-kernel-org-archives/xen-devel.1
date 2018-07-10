From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 2/4] automation: install some packages
 for CentOS from EPEL
Date: Tue, 10 Jul 2018 08:16:45 +0100
Message-ID: <20180710071645.o7oh7x2463fnsxzp@citrix.com>
References: <20180709153216.15892-1-wei.liu2@citrix.com>
 <20180709153216.15892-3-wei.liu2@citrix.com>
 <20180709164659.uhxoyrklat7d6j6l@doug-macbook.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9fb0=j2=citrix.com=prvs=7221156ca=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fcmtO-0003QC-L3
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 07:16:58 +0000
Content-Disposition: inline
In-Reply-To: <20180709164659.uhxoyrklat7d6j6l@doug-macbook.localdomain>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMDksIDIwMTggYXQgMTE6NDY6NTlBTSAtMDUwMCwgRG91ZyBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gTW9uLCBKdWwgMDksIDIwMTggYXQgMDQ6MzI6MTRQTSArMDEwMCwgV2VpIExp
dSB3cm90ZToKPiA+IFRoZXkgYXJlIG5lZWRlZCB0byBidWlsZCB0b29scy4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gIGF1
dG9tYXRpb24vYnVpbGQvY2VudG9zLzcuMi5kb2NrZXJmaWxlIHwgNiArKysrKysKPiA+ICAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hdXRvbWF0
aW9uL2J1aWxkL2NlbnRvcy83LjIuZG9ja2VyZmlsZSBiL2F1dG9tYXRpb24vYnVpbGQvY2VudG9z
LzcuMi5kb2NrZXJmaWxlCj4gPiBpbmRleCAzNGVhYzlhYmQ0Li5mNDZhNWUzZjJiIDEwMDY0NAo+
ID4gLS0tIGEvYXV0b21hdGlvbi9idWlsZC9jZW50b3MvNy4yLmRvY2tlcmZpbGUKPiA+ICsrKyBi
L2F1dG9tYXRpb24vYnVpbGQvY2VudG9zLzcuMi5kb2NrZXJmaWxlCj4gPiBAQCAtNiw2ICs2LDkg
QEAgTEFCRUwgbWFpbnRhaW5lci5uYW1lPSJUaGUgWGVuIFByb2plY3QiIFwKPiA+ICAjIHRoZSB2
ZXJzaW9uIHdlIHdhbnQKPiA+ICBDT1BZIENlbnRPUy03LjIucmVwbyAvZXRjL3l1bS5yZXBvcy5k
L0NlbnRPUy1CYXNlLnJlcG8KPiA+ICAKPiA+ICsjIGluc3RhbGwgRVBFTCBmb3IgZGV2ODYsIHh6
LWRldmVsIGFuZCBwb3NzaWJseSBvdGhlciBwYWNrYWdlcwo+ID4gK1JVTiB5dW0gLXkgaW5zdGFs
bCBodHRwczovL2RsLmZlZG9yYXByb2plY3Qub3JnL3B1Yi9lcGVsL2VwZWwtcmVsZWFzZS1sYXRl
c3QtNy5ub2FyY2gucnBtCj4gCj4gIiYmIHl1bSBjbGVhbiBhbGwiIHRvIGtlZXAgdGhlIGxheWVy
IHNpemUgZG93bgo+IAo+IFdpdGggdGhhdCBhZGRlZCBpbiB0aGVyZSAodW5sZXNzIEFja2VkLWJ5
IGlzIG1vcmUgYXBwcm9wcmlhdGUpOgoKRWl0aGVyIGlzIGZpbmUuCgo+IAo+IFJldmlld2VkLWJ5
OiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+CgpUaGFua3MuCgpXZWkuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
