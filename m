From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH RFC] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Wed, 17 Oct 2018 16:26:17 +0300
Message-ID: <d66b5a9f-4e88-7d67-9238-3f813e665d1d@bitdefender.com>
References: <1535963136-31751-1-git-send-email-rcojocaru@bitdefender.com>
 <a44355eb-79ab-30ee-26d1-4d611dc8eeb7@citrix.com>
 <ac06731a-a44c-fce7-0638-eecf68579176@citrix.com>
 <d0358c5a-1f63-e64c-d988-d5475caa766f@bitdefender.com>
 <5BB62FA902000078001EE6BC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rnu4=m5=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gClqA-0007MS-Bu
 for xen-devel@lists.xenproject.org; Wed, 17 Oct 2018 13:26:22 +0000
In-Reply-To: <5BB62FA902000078001EE6BC@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvNC8xOCA2OjIwIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBSb2dlciByZWNlbnRseSBo
YXMgcG9zdGVkIGEgcGF0Y2ggYWRkaW5nIHJhbmdlc2V0X21lcmdlKCksIHdoaWNoIEkgdGhpbmsK
PiBpcyBtb3JlIGdlbmVyYWwgdGhhbiB5b3VyIHJhbmdlc2V0X2NvcHkoKS4gVGhhdCBzYWlkLCBJ
J20gaW4gbm8gd2F5Cj4gY29udmluY2VkIGNvcHlpbmcgKGFuZCB0aGVuIGtlZXBpbmcgaW4gc3lu
YykgdGhlIHJhbmdlIHNldHMgYWNyb3NzIHRoZQo+IGFsdHAybS1zIGlzIHRoZSBiZXN0IGFwcHJv
YWNoLiBJdCBtYXkgd2VsbCBiZSB0aGF0IHRoZSBvcHRpbWFsIHNvbHV0aW9uIGlzCj4gc29tZXdo
ZXJlIGluIHRoZSBtaWRkbGUgYmV0d2VlbiBzaGFyaW5nIGV2ZXJ5dGhpbmcgYW5kIGNvcHlpbmcK
PiBldmVyeXRoaW5nLgoKV291bGQgaXQgYmUgcG9zc2libGUgdG8gZ2V0IFJvZ2VyJ3MgcGF0Y2gg
aW50byBzdGFnaW5nPwoKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1s
L3hlbi1kZXZlbC8yMDE4LTA2L21zZzAxMzMxLmh0bWwKCkl0IGxvb2tzIHNpbXBsZSBlbm91Z2gg
YW5kIGl0IGhhcyBhbHJlYWR5IGFja2VkIGJ5IFdlaS4KCgpUaGFua3MsClJhenZhbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
