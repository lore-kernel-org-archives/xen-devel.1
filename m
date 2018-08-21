From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] tools: libxl/xl: run NUMA placement even
 when an hard-affinity is set
Date: Tue, 21 Aug 2018 16:31:05 +0100
Message-ID: <23420.12345.154525.677937@mariner.uk.xensource.com>
References: <153452538306.14879.2645077465028661264.stgit@Palanthas.fritz.box>
 <20180820101428.djudte4z2wye3cz3@citrix.com>
 <b346c13a4a05c75d531da1dcfa7ea684a0d5089e.camel@suse.com>
 <23419.59543.385873.125444@mariner.uk.xensource.com>
 <0272aceb4d34d1d9f4a92c1b6faaede59a1242a8.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kqmj=le=citrix.com=prvs=764db257d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fs8cf-0004xh-La
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 15:31:09 +0000
In-Reply-To: <0272aceb4d34d1d9f4a92c1b6faaede59a1242a8.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RGFyaW8gRmFnZ2lvbGkgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSF0gdG9vbHM6IGxp
YnhsL3hsOiBydW4gTlVNQSBwbGFjZW1lbnQgZXZlbiB3aGVuIGFuIGhhcmQtYWZmaW5pdHkgaXMg
c2V0Iik6Cj4gRG8gSSBsZWF2ZSBpdCB1bmRlciB0aGlzIHNwZWNpYWwgIm1hbnVhbGx5IGVuYWJs
ZSBmb3IgZGV2ZWxvcG1lbnQgYW5kCj4gdGVzdGluZyIga2luZCBvZiB0aGluZz8KClllcywgSSB0
aGluayAjaWZkZWYgREVCVUcgb3Igd2hhdGV2ZXIgaXMgZmluZS4gIGxpYnhsX2V2ZW50LmMgaGFz
IHRoYXQKc3R5bGUgYWxyZWFkeS4KCj4gRG8gSSBtYWtlIGl0IGFsd2F5cyBvbj8KCk5vdCBpZiB5
b3UgdGhpbmsgaXQncyB0b28gc2xvdy4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
