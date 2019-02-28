From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.12] x86/altp2m: Fix build with
 !CONFIG_HVM
Date: Thu, 28 Feb 2019 13:18:10 +0000
Message-ID: <ff2ecd90-9da2-caf9-08a2-8952259a7a04@citrix.com>
References: <1551358272-666-1-git-send-email-andrew.cooper3@citrix.com>
 <20190228125345.rfst6ujtkgbjfeme@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190228125345.rfst6ujtkgbjfeme@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMjAxOSAxMjo1MywgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIEZlYiAyOCwgMjAx
OSBhdCAxMjo1MToxMlBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBjL3MgMGVjOWI0
ZWYzMTQ4ICJ4ODYvdm14OiBGaXggc2VjdXJpdHkgaXNzdWUgd2hlbiBhIGd1ZXN0IGJhbGxvb25z
IG91dCB0aGUKPj4gYy9zIGU3MmVjYzc2MTU0MSAieDg2L2FsdHAybTogUmV3b3JrICNWRSBlbmFi
bGUvZGlzYWJsZSBwYXRocyIgZGlkbid0IGhhdmUgYQo+PiBzdWl0YWJsZSBwcm90b3R5cGUgaW4g
dGhlICFDT05GSUdfSFZNIGNhc2UuCj4+Cj4+IEludHJvZHVjZSBvbmUgdG8gZml4IHRoZSBidWls
ZC4KPj4KPj4gU3BvdHRlZCBieSBUcmF2aXMuCj4gSSB0aGluayB5b3UgbWVhbnQgR2l0bGFiIENJ
PwoKTm9wZS4KCmh0dHBzOi8vdHJhdmlzLWNpLm9yZy9hbmR5aGhwL3hlbi9idWlsZHMvNDk5Nzc2
NzMyCgpHaXRsYWIgZG9lc24ndCBhcHBlYXIgdG8gaGF2ZSBub3RpY2VkIHlldC4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
