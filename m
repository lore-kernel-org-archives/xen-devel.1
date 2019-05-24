From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/5] print: introduce a format specifier for
 pci_sbdf_t
Date: Fri, 24 May 2019 11:59:47 +0100
Message-ID: <5d339f33-a5e7-49be-ee40-5782401ceab1@citrix.com>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-5-roger.pau@citrix.com>
 <5CE7C93A0200007800231F24@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IEXw=TY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hU7vY-0003Oy-HM
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 10:59:56 +0000
In-Reply-To: <5CE7C93A0200007800231F24@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDUvMjAxOSAxMTozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTAuMDUuMTkg
YXQgMTg6MTAsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IFRoZSBuZXcgZm9ybWF0
IHNwZWNpZmllciBpcyAnJXBwJywgYW5kIHByaW50cyBhIHBjaV9zYmRmX3QgdXNpbmcgdGhlCj4+
IHNlZzpidXM6ZGV2LmZ1bmMgZm9ybWF0LiBSZXBsYWNlIGFsbCBTQkRGcyBwcmludGVkIHVzaW5n
Cj4+ICclMDR4OiUwMng6JTAyeC4ldScgdG8gdXNlIHRoZSBuZXcgZm9ybWF0IHNwZWNpZmllci4K
PiBTbyBvbiB0aGUgcG9zaXRpdmUgc2lkZSBMaW51eCBkb2Vzbid0IHVzZSAncCcgeWV0LCBzbyB3
ZSdyZSBvbmx5IGF0IHJpc2sKPiBvZiBhIGZ1dHVyZSBjb25mbGljdC4gSG93ZXZlciwgaGF2aW5n
IHRvIHBhc3MgYSA2NC1iaXQgcG9pbnRlciBqdXN0Cj4gdG8gcHJpbnQgYSAzMi1iaXQgZW50aXR5
IHNlZW1zIHJhdGhlciB3YXN0ZWZ1bCB0byBtZS4gU2luY2Ugd2UgY2FuJ3QKPiB1c2UgZW50aXJl
bHkgbmV3IGZvcm1hdCBzcGVjaWZpZXJzLCBkaWQgeW91IGNvbnNpZGVyIChhYil1c2luZyBvbmUK
PiB3ZSByYXJlbHkgdXNlLCBsaWtlICVvLCBzdWZmaXhlZCBzaW1pbGFybHkgbGlrZSB3ZSBkbyBm
b3IgJXA/IFRoZQo+IGV4dGVuc2lvbiBjb3VsZCBiZSByZXN0cmljdGVkIHRvIGFwcGx5IG9ubHkg
d2hlbiBuZWl0aGVyIGZpZWxkIHdpZHRoCj4gbm9yIHByZWNpc2lvbiBub3IgYW55IGZsYWdzIHdl
cmUgc3BlY2lmaWVkLCBpLmUuIG9ubHkgdG8gcGxhaW4gJW8gKGF0Cj4gbGVhc3QgaW5pdGlhbGx5
KS4KPgo+IFdlJ2QgdGhlbiBoYXZlIHNvbWV0aGluZyBhbG9uZyB0aGUgbGluZXMgb2YKPgo+ICNk
ZWZpbmUgUFJJX3NiZGYgIm9wIgo+ICNkZWZpbmUgUFJJX1NCREYodikgKCh2KS5zYmRmKQo+Cj4g
YW5kCj4KPiAgICAgcHJpbnRrKCIlIiBQUklfc2JkZiAiOiAuLi5cbiIsIFBSSV9TQkRGKHBkZXYt
PnNiZGYpLCAuLi4pOwoKRXhjZXB0IHRoZSBhbnN3ZXIgd2lsbCBiZSB0aGUgc2FtZSBhcyBldmVy
eSB0aW1lIHlvdSd2ZSBhc2tlZCB0aGlzIGluCnRoZSBwYXN0LgoKTm8sIGJlY2F1c2UgLVdmb3Jt
YXQgZG9lc24ndCB0b2xlcmF0ZSBpdC4KClRoZSAqb25seSogZmxleGliaWxpdHkgd2UgaGF2ZSB0
byBwbGF5IHdpdGggaXMgc3VmZml4ZXMgdG8gJXAKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
