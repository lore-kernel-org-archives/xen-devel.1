From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 8/8] PM / Hibernate: exclude all
 PageOffline() pages
Date: Wed, 21 Nov 2018 13:21:08 +0100
Message-ID: <88f19102-9830-1ed0-1f46-56e11316ca09__19733.0904113644$1542802830$gmane$org@redhat.com>
References: <20181119101616.8901-1-david@redhat.com>
 <20181119101616.8901-9-david@redhat.com>
 <11E3C0B0-AEED-42C6-A21C-1820F4B47A68@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmdf=OA=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gPRVn-0005Nd-UO
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 12:21:43 +0000
In-Reply-To: <11E3C0B0-AEED-42C6-A21C-1820F4B47A68@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: William Kucharski <william.kucharski@oracle.com>
Cc: Len Brown <len.brown@intel.com>, Michal Hocko <mhocko@suse.com>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Linux-MM <linux-mm@kvack.org>, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Machek <pavel@ucw.cz>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjEuMTEuMTggMTI6MzUsIFdpbGxpYW0gS3VjaGFyc2tpIHdyb3RlOgo+IElmIHlvdSBhcmUg
YWRkaW5nIFBhZ2VPZmZsaW5lKHBhZ2UpIHRvIHRoZSBjb25kaXRpb24gbGlzdCBvZiB0aGUgYWxy
ZWFkeSBleGlzdGluZyBpZiBpbgo+IHNhdmVhYmxlX2hpZ2htZW1fcGFnZSgpLCB3aHkgZXhwbGlj
aXRseSBhZGQgaXQgYXMgYSBzZXBhcmF0ZSBzdGF0ZW1lbnQgaW4gc2F2ZWFibGVfcGFnZSgpPwo+
IAo+IEl0IHdvdWxkIHNlZW0gbW9yZSBjb25zaXN0ZW50IHRvIG1ha2UgdGhlIHNlY29uZCBjaGVj
azoKPiAKPiAtCWlmIChzd3N1c3BfcGFnZV9pc19mb3JiaWRkZW4ocGFnZSkgfHwgc3dzdXNwX3Bh
Z2VfaXNfZnJlZShwYWdlKSkKPiArCWlmIChzd3N1c3BfcGFnZV9pc19mb3JiaWRkZW4ocGFnZSkg
fHwgc3dzdXNwX3BhZ2VfaXNfZnJlZShwYWdlKSB8fAo+ICsJCVBhZ2VPZmZsaW5lKHBhZ2UpKQo+
IAo+IGluc3RlYWQuCj4gCj4gSXQncyBhZG1pdHRlZGx5IGEgbml0IGJ1dCBpdCBqdXN0IHNlZW1z
IGNsZWFuZXIgdG8gZWl0aGVyIGRvIHRoYXQgb3IsIGlmIHlvdXIgaW50ZW50aW9uCj4gd2FzIHRv
IHNlcGFyYXRlIHRoZSBQYWdlIGNoZWNrcyBmcm9tIHRoZSBzd3N1c3AgY2hlY2tzLCB0byBicmVh
ayB0aGUgY2FsbHMgdG8KPiBQYWdlUmVzZXJ2ZWQoKSBhbmQgUGFnZU9mZmxpbmUoKSBpbnRvIHRo
ZWlyIG93biBjaGVjayBpbiBzYXZlYWJsZV9oaWdobWVtX3BhZ2UoKS4KCkknbGwgc3BsaXQgUGFn
ZVJlc2VydmVkKCkgYW5kIFBhZ2VPZmZsaW5lKCkgb2ZmIGZyb20gdGhlIHN3c3VzcCBjaGVja3Ms
CnRoYW5rcyBmb3IgeW91ciBjb21tZW50IQoKPiAKPiBUaGFua3MhCj4gICAgIC0tIEJpbGwKCgot
LSAKClRoYW5rcywKCkRhdmlkIC8gZGhpbGRlbmIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
