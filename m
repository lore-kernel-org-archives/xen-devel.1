From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V5] x86/hvm: fix domain crash when CR3 has
 the noflush bit set
Date: Mon, 19 Feb 2018 10:48:12 +0200
Message-ID: <6fe12bcb-3bde-b537-14d8-df06bd44af8f@bitdefender.com>
References: <1518776535-2951-1-git-send-email-rcojocaru@bitdefender.com>
 <5A86CBF702000078001A85C3@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A86CBF702000078001A85C3@prv-mh.provo.novell.com>
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
Cc: kevin.tian@intel.com, tamas@tklengyel.com, suravee.suthikulpanit@amd.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, tim@xen.org, xen-devel@lists.xen.org, jun.nakajima@intel.com, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTYvMjAxOCAwMToxNyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTYuMDIu
MTggYXQgMTE6MjIsIDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4gVGhlIGVt
dWxhdGlvbiBsYXllcnMgb2YgWGVuIGxhY2sgUENJRCBzdXBwb3J0LCBhbmQgYXMgd2Ugb25seSBv
ZmZlcgo+PiBQQ0lEIHRvIEhBUCBndWVzdHMsIGFsbCB3cml0ZXMgdG8gQ1IzIGFyZSBoYW5kbGVk
IGJ5IGhhcmR3YXJlLAo+PiBleGNlcHQgd2hlbiBpbnRyb3NwZWN0aW9uIGlzIGludm9sdmVkLiBD
b25zZXF1ZW50bHksIHRyeWluZyB0byBzZXQKPj4gQ1IzIHdoZW4gdGhlIG5vZmx1c2ggYml0IGlz
IHNldCBpbiBodm1fc2V0X2NyMygpIGxlYWRzIHRvIGRvbWFpbgo+PiBjcmFzaGVzLiBUaGUgd29y
a2Fyb3VuZCBpcyB0byBjbGVhciB0aGUgbm9mbHVzaCBiaXQgaW4KPj4gaHZtX3NldF9jcjMoKS4g
Q1IzIHZhbHVlcyBpbiBodm1fbW9uaXRvcl9jcigpIGFyZSBhbHNvIHNhbml0aXplZC4KPj4gQWRk
aXRpb25hbGx5LCBhIGJvb2wgcGFyYW1ldGVyIG5vdyBwcm9wYWdhdGVzIHRvCj4+IHtzdm0sdm14
fV91cGRhdGVfZ3Vlc3RfY3IoKSwgc28gdGhhdCBubyBmbHVzaGVzIG9jY3VyIHdoZW4KPj4gdGhl
IGJpdCB3YXMgc2V0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pv
Y2FydUBiaXRkZWZlbmRlci5jb20+Cj4+IFJlcG9ydGVkLWJ5OiBCaXR3ZWFzaWwgPGJpdHdlYXNp
bEBjcnlwdG9oYXplLmNvbT4KPj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgo+PiBBY2tlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0
a2xlbmd5ZWwuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpTaG91bGQgSSByZWJhc2UgdGhpcyBiZWNhdXNlIG9mIGNvbW1pdAoyNDQ3MGI5OWMx
NjcxZGNhNTMxYzJjZjU3NDdlZGEyZjg4OTJlY2JjPwoKClRoYW5rcywKUmF6dmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
