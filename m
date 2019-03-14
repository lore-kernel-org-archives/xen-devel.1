From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-next 7/9] xen: Convert is_xen_heap_mfn
 to use typesafe MFN
Date: Thu, 14 Mar 2019 05:47:41 -0600
Message-ID: <5C8A3F5D020000780021E8A3@prv1-mh.provo.novell.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-8-julien.grall@arm.com>
 <5C891BFF020000780021E35F@prv1-mh.provo.novell.com>
 <e36aeed3-0d7f-f0e6-4e13-adf4d44db0be@arm.com>
 <5C8A0856020000780021E649@prv1-mh.provo.novell.com>
 <f78bf48b-9371-20bf-98cb-9daf3143c39b@arm.com>
 <008b64d6-8ef2-be9c-ed4c-999d61fbfd61@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U6t1=RR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4Opz-0002dm-DP
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 11:47:51 +0000
In-Reply-To: <008b64d6-8ef2-be9c-ed4c-999d61fbfd61@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE5IGF0IDExOjE0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gWW91IGRvIGtub3cgdGhhdCBtZm5fYWRkKG1mbiwgLTEpIHdpbGwgRFRSVD8KCkl0IHdp
bGwsIGJ1dCBpbW8gaXQgbG9va3Mgc2xpZ2h0bHkgb2RkIGluIHBhcnRpY3VsYXIgaW4gZS5nLgpm
b3IgKCAuLi47IC4uLjsgbWZuX2FkZChtZm4sIC0xKSApLCBoZW5jZSBJIGRpZG4ndCBzdWdnZXN0
IGl0LiBCdXQKSSBkb24ndCBvYmplY3QgZWl0aGVyLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
