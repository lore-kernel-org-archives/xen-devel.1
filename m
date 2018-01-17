From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH 6/6] firmware/shim: fix build process to use
 POSIX find options
Date: Wed, 17 Jan 2018 17:03:23 +0000
Message-ID: <23135.33243.625395.569565@mariner.uk.xensource.com>
References: <20180117094814.32772-1-roger.pau@citrix.com>
 <20180117094814.32772-7-roger.pau@citrix.com>
 <23135.30907.66445.273053@mariner.uk.xensource.com>
 <20180117162855.itzoanq67fn442er@citrix.com>
 <23135.32741.685675.991384@mariner.uk.xensource.com>
 <20180117165702.2hrmjzlh5lb62hzr@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rlig=em=citrix.com=prvs=548fb5411=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ebr7e-0002rU-HG
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 17:03:34 +0000
In-Reply-To: <20180117165702.2hrmjzlh5lb62hzr@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIIDYvNl0gZmlybXdhcmUvc2hpbTogZml4IGJ1aWxk
IHByb2Nlc3MgdG8gdXNlIFBPU0lYIGZpbmQgb3B0aW9ucyIpOgo+IE9uIFdlZCwgSmFuIDE3LCAy
MDE4IGF0IDA0OjU1OjAxUE0gKzAwMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gRllJIEkgYW0g
Z29pbmcgdG8gc2hpcCB0aGUgcGF0Y2ggYXMgaXMgdG8gImNvbWV0IiB1c2VycyB2aWEgYW4gWFNB
LTI1NAo+ID4gdXBkYXRlLiAgSSdtIGp1c3QgcXVpYmJsaW5nIGFib3V0IHRoaXMgZm9yICNzdGFn
aW5nLgo+IAo+IFllYWgsIHdlIGNhbiBkZWZpbml0ZWx5IGNoYW5nZSB0aGUgcnVuZSB0byBzb21l
dGhpbmcgYmV0dGVyIG9uY2Ugd2UgaGF2ZQo+IGFsbCB0aGUgY3JpdGljYWwgaXNzdWVzIHNvbHZl
ZC4gVGhlIHJ1bmUgd2FzIHRoZSBiZXN0IEkgY291bGQgY29tZSB1cAo+IHdpdGggdW5kZXIgYSBz
aG9ydCBub3RpY2UuIEFuZCBpdCB3YXNuJ3QgY3JpdGljYWwgc28gSSBtb3ZlZCBvbiB0bwo+IHNv
bWV0aGluZyBlbHNlLgoKUmlnaHQsIHRoYW5rcy4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
