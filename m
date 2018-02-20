From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/5] x86/pv: Avoid leaking other guests'
 MSR_TSC_AUX values into PV context
Date: Tue, 20 Feb 2018 15:32:04 +0000
Message-ID: <20180220153204.o2kxdq4mebuutxan@citrix.com>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
 <1519127923-23539-3-git-send-email-andrew.cooper3@citrix.com>
 <20180220152244.2pv64jva6jsmodph@citrix.com>
 <3c9f5649-6a2b-a3c0-6441-c1fc4d127b06@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <3c9f5649-6a2b-a3c0-6441-c1fc4d127b06@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMDM6MjY6MjBQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyMC8wMi8xOCAxNToyMiwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFR1ZSwgRmVi
IDIwLCAyMDE4IGF0IDExOjU4OjQwQU0gKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPj4g
SWYgdGhlIENQVSBwaXBlbGluZSBzdXBwb3J0cyBSRFRTQ1Agb3IgUkRQSUQsIGEgZ3Vlc3QgY2Fu
IG9ic2VydmUgdGhlIHZhbHVlIGluCj4gPj4gTVNSX1RTQ19BVVgsIGlycmVzcGVjdGl2ZSBvZiB3
aGV0aGVyIHRoZSByZWxldmFudCBDUFVJRCBmZWF0dXJlcyBhcmUKPiA+PiBhZHZlcnRpc2VkL2hp
ZGRlbi4KPiA+Pgo+ID4gVGhpcyBzZXR1cCB3b3JrcyBvbmx5IGJlY2F1c2UgQ1I0LlRTRD0wPwo+
IAo+IEhhdmluZyBDUjQuVFNEIGNsZWFyIGlzIHRoZSBkZWZhdWx0LCBhbmQgbWVhbnMgUkRUU0NQ
IHdpbGwgd29yayBhdCBhbnkKPiBwcml2aWxlZ2UgbGV2ZWwuwqAgU2V0dGluZyBDUjQuVFNEIChl
aXRoZXIgZHVlIHRvIHZpcnR1YWxpc2VkIFRTQywgb3IKPiBiZWNhdXNlIHRoZSBndWVzdCBrZXJu
ZWwgd2FudHMgdG8gdHJhcCB1c2VyIGFjY2Vzc2VzKSB3aWxsIGNhdXNlIFJEVFNDUAo+IHRvIHRy
YXAgaW50byBlbXVsLXByaXYtb3AuCj4gCj4gVGhlcmUgaXMgbm8gd2F5IG9mIGNhdXNpbmcgUkRQ
SUQgdG8gdHJhcCAob24gaGFyZHdhcmUgd2hpY2ggc3VwcG9ydHMgdGhlCj4gaW5zdHJ1Y3Rpb24p
LCBhbmQgaXQgd2lsbCByZWFkIHJlYWQgdGhlIGN1cnJlbnQgdmFsdWUgb2YgTVNSX1RTQ19BVVgu
CgpBbHJpZ2h0LgoKSW4gYW55IGNhc2U6CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
