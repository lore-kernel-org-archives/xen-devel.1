From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH] iommu: leave IOMMU enabled by default
 during kexec crash transition
Date: Wed, 20 Feb 2019 19:05:16 +0000
Message-ID: <be38002a-6ff2-c590-8b3e-9ebfb4d0658b@citrix.com>
References: <1550506867-26221-1-git-send-email-igor.druzhinin@citrix.com>
 <e10e56f7-0da9-3e30-1f50-c1f9ab16dcb1@citrix.com>
 <5C6BB3920200007800217DAD@prv1-mh.provo.novell.com>
 <2c2d2582-fa90-f02e-4574-0683efebaa26@citrix.com>
 <5C6D160A02000078002183E3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yUjJ=Q3=citrix.com=prvs=94737ca7f=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1gwXBh-00085Y-ML
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 19:05:45 +0000
In-Reply-To: <5C6D160A02000078002183E3@prv1-mh.provo.novell.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDIvMjAxOSAwODo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gCj4gRXZlcnl0aGluZywg
YWJzb2x1dGVseSBldmVyeXRoaW5nIGlzIHBvc3NpYmxlIGFzIGEgY2F1c2UgZm9yIGEgY3Jhc2gu
Cj4gSSBkb24ndCBzZWUgd2h5IGRldmljZSBpc29sYXRpb24gd291bGQgbWF0dGVyIGhlcmUgYXQg
YWxsLiBQYWdlIHRhYmxlCj4gY29ycnVwdGlvbiAoYmUgaXQgSU9NTVUgb3IgQ1BVIG9uZSkgY2Fu
IGJlIGNhdXNlZCBieQo+IG1hbGZ1bmN0aW9uaW5nIGtlcm5lbCBjb2RlLCBlbnRpcmVseSB1bnJl
bGF0ZWQgdG8gd2hhdCBkZXZpY2VzIGRvLgo+IAoKWWVzLCBJIGJsaW5kbHkgYXNzdW1lZCB0aGF0
IHN0cmF5IERNQSBpcyB0aGUgbW9zdCBjb21tb24gc291cmNlIG9mCmtlcm5lbCBkYXRhIGNvcnJ1
cHRpb24uIFVuZm9ydHVuYXRlbHksIHdlIGRvbid0IHJlYWxseSBoYXZlIGEgY2hvaWNlIG5vdwot
IGFsbW9zdCBhbGwgcGxhdGZvcm1zIHRoZXNlIGRheXMgcmFpc2Ugc29tZSBmb3JtIG9mIGFuIGVy
cm9yIGluIHRoZQpldmVudCBvZiB1bmhhbmRlZCB0cmFuc2xhdGlvbiBmYXVsdCAoYXQgbGVhc3Qg
bW9zdCBvZiB0aG9zZSB3ZSBoYXZlIG5vdwppbiBvdXIgbGFicykuIFNvIGl0J3MgZWl0aGVyIHNs
aWdodCBjaGFuY2Ugb2YgZW50ZXJpbmcgdGhlIGNyYXNoIGtlcm5lbAp3aXRoIGNvcnJ1cHRlZCBJ
T01NVSBwYWdlcyBvciBub3QgZW50ZXJpbmcgaXQgYXQgYWxsIGluIG1vc3Qgb2YgdGhlIGNhc2Vz
LgoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
