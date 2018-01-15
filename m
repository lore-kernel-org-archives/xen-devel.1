From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v8 10/17] x86/hvm: Permit guests direct
 access to MSR_{SPEC_CTRL, PRED_CMD}
Date: Mon, 15 Jan 2018 11:02:21 -0500
Message-ID: <5542fa04-96f9-8bf6-8050-b3ea8969ad21@oracle.com>
References: <1515780067-31735-1-git-send-email-andrew.cooper3@citrix.com>
 <1515780067-31735-11-git-send-email-andrew.cooper3@citrix.com>
 <5A5C9A55020000780019EBA8@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A5C9A55020000780019EBA8@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMS8xNS8yMDE4IDA2OjExIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxMi4w
MS4xOCBhdCAxOTowMSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBGb3Ig
cGVyZm9ybWFuY2UgcmVhc29ucywgSFZNIGd1ZXN0cyBzaG91bGQgaGF2ZSBkaXJlY3QgYWNjZXNz
IHRvIHRoZXNlIE1TUnMKPj4gd2hlbiBwb3NzaWJsZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IHdpdGggb25lIHNwZWxsaW5nIGZpeCAo
c2VlIGJlbG93KQo+IAo+IEFzIHRoZXNlIGFyZSBub24tdHJpdmlhbCBjaGFuZ2VzIHRvIFZNWCBh
bmQgU1ZNIGNvZGUgSSB0aGluayB5b3UKPiBzaG91bGQgaGF2ZSBDYy1lZCB0aGUgbWFpbnRhaW5l
cnMgKG5vdyBhZGRlZCwgYW5kIGxlYXZpbmcgdGhlCj4gZnVsbCBwYXRjaCBpbiBjb250ZXh0IGZv
ciB0aGVtLgoKClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBv
cmFjbGUuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
