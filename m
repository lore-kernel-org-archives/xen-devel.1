From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 13/14] xen/mm: Convert {s,
 g}et_gpfn_from_mfn() to use typesafe MFN
Date: Fri, 10 May 2019 08:14:24 -0600
Message-ID: <5CD58740020000780022D9D4@prv1-mh.provo.novell.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-14-julien.grall@arm.com>
 <5CD57AEC020000780022D885@prv1-mh.provo.novell.com>
 <253e3a5c-8e84-a671-499c-7009d93658bb@arm.com>
 <5CD57F9F020000780022D936@prv1-mh.provo.novell.com>
 <9b8e78a4-db71-1b0d-a9c6-89a35e5feb2f@arm.com>
 <5CD58484020000780022D98E@prv1-mh.provo.novell.com>
 <fae0871e-1ca9-890b-f782-562501782bcb@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP6ID-000196-PM
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:14:33 +0000
In-Reply-To: <fae0871e-1ca9-890b-f782-562501782bcb@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA1LjE5IGF0IDE2OjA1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIG92ZXJ3aGVsbWluZyBtYWpvcml0eSB3YXkgb2YgcHJpbnRpbmcgbWZucyBpcyB2
aWE6Cj4gCj4gbWZuICUiUFJJX21mbiIKPiAKPiB3aGljaCBpcyBhbG1vc3QgZnVsbHkgY29uc2lz
dGVudCBhY3Jvc3MgdGhlIHg4NiBjb2RlLgo+IAo+IFZhcmlvdXMgYml0cyBvZiBjb21tb24gY29k
ZSwgYW5kIG1vc3Qgb2YgQVJNIGNvZGUgdXNlIHZhcmlhdGlvbnMgb2YKPiAlIyJQUklfbWZuIiwg
YW5kIHRoaXMgb3VnaHQgdG8gYmUgZml4ZWQuCgpPaCwgc28geW91J3JlIGZpbmUgd2l0aCBvbWl0
dGluZyB0aGUgMHggaGVyZT8gVGhhdCdzIGZpbmUgd2l0aCBtZS4gSSd2ZQpzdWdnZXN0ZWQgaXRz
IGFkZGl0aW9uIG1lcmVseSBiZWNhdXNlIGNvbW1vbmx5IHlvdSBhc2sgZm9yIHRoZSBwcmVmaXgu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
