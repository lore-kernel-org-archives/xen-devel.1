From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] iommu: leave IOMMU enabled by default
 during kexec crash transition
Date: Fri, 22 Feb 2019 02:49:18 -0700
Message-ID: <5C6FC59E020000780021908D@prv1-mh.provo.novell.com>
References: <1550506867-26221-1-git-send-email-igor.druzhinin@citrix.com>
 <e10e56f7-0da9-3e30-1f50-c1f9ab16dcb1@citrix.com>
 <5C6BB3920200007800217DAD@prv1-mh.provo.novell.com>
 <2c2d2582-fa90-f02e-4574-0683efebaa26@citrix.com>
 <5C6D160A02000078002183E3@prv1-mh.provo.novell.com>
 <be38002a-6ff2-c590-8b3e-9ebfb4d0658b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gx7UH-00029j-3A
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 09:51:21 +0000
In-Reply-To: <be38002a-6ff2-c590-8b3e-9ebfb4d0658b@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAyLjE5IGF0IDIwOjA1LCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjAvMDIvMjAxOSAwODo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IAo+PiBFdmVy
eXRoaW5nLCBhYnNvbHV0ZWx5IGV2ZXJ5dGhpbmcgaXMgcG9zc2libGUgYXMgYSBjYXVzZSBmb3Ig
YSBjcmFzaC4KPj4gSSBkb24ndCBzZWUgd2h5IGRldmljZSBpc29sYXRpb24gd291bGQgbWF0dGVy
IGhlcmUgYXQgYWxsLiBQYWdlIHRhYmxlCj4+IGNvcnJ1cHRpb24gKGJlIGl0IElPTU1VIG9yIENQ
VSBvbmUpIGNhbiBiZSBjYXVzZWQgYnkKPj4gbWFsZnVuY3Rpb25pbmcga2VybmVsIGNvZGUsIGVu
dGlyZWx5IHVucmVsYXRlZCB0byB3aGF0IGRldmljZXMgZG8uCj4+IAo+IAo+IFllcywgSSBibGlu
ZGx5IGFzc3VtZWQgdGhhdCBzdHJheSBETUEgaXMgdGhlIG1vc3QgY29tbW9uIHNvdXJjZSBvZgo+
IGtlcm5lbCBkYXRhIGNvcnJ1cHRpb24uIFVuZm9ydHVuYXRlbHksIHdlIGRvbid0IHJlYWxseSBo
YXZlIGEgY2hvaWNlIG5vdwo+IC0gYWxtb3N0IGFsbCBwbGF0Zm9ybXMgdGhlc2UgZGF5cyByYWlz
ZSBzb21lIGZvcm0gb2YgYW4gZXJyb3IgaW4gdGhlCj4gZXZlbnQgb2YgdW5oYW5kZWQgdHJhbnNs
YXRpb24gZmF1bHQgKGF0IGxlYXN0IG1vc3Qgb2YgdGhvc2Ugd2UgaGF2ZSBub3cKPiBpbiBvdXIg
bGFicykuIFNvIGl0J3MgZWl0aGVyIHNsaWdodCBjaGFuY2Ugb2YgZW50ZXJpbmcgdGhlIGNyYXNo
IGtlcm5lbAo+IHdpdGggY29ycnVwdGVkIElPTU1VIHBhZ2VzIG9yIG5vdCBlbnRlcmluZyBpdCBh
dCBhbGwgaW4gbW9zdCBvZiB0aGUgY2FzZXMuCgpBbmQgSSdtIGZpbmUgd2l0aCB0aGlzLCBhcyBs
b25nIGFzIHRoZSBuZXcgKGV2ZW4gaWYgc21hbGxlcikgcmlzayBpcwptZW50aW9uZWQgaW4gdGhl
IGRlc2NyaXB0aW9uLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
