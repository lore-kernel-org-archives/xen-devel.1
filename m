From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4.1 4/6] xen/x86: Allow stubdom access to
 irq created for msi.
Date: Fri, 22 Feb 2019 04:11:05 -0700
Message-ID: <5C6FD8C9020000780021911C@prv1-mh.provo.novell.com>
References: <20190208101559.GA21228@mail-itl>
 <20190208101705.31790-1-marmarek@invisiblethingslab.com>
 <20190221164751.hjtyddw63ztmc3yk@Air-de-Roger>
 <20190221174040.GV21228@mail-itl>
 <20190222104222.p7niwzgngaf3uz2k@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gx8jX-0001Ks-Vr
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 11:11:12 +0000
In-Reply-To: <20190222104222.p7niwzgngaf3uz2k@Air-de-Roger>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>, Simon Gaiser <simon@invisiblethingslab.com>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAyLjE5IGF0IDExOjQyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEphbiBkbyB5b3Uga25vdyB3aGV0aGVyIHBjaV9yZW1vdmVfZGV2aWNlIGlzIHN1cHBvc2VkIHRv
IGJlIHVzZWQKPiBhZ2FpbnN0IGRldmljZXMgYXNzaWduZWQgdG8gYSBkb21haW4gZGlmZmVyZW50
IHRoYW4gdGhlIGhhcmR3YXJlCj4gZG9tYWluPwoKTm8sIEkgZG9uJ3QgdGhpbmsgaXQgb3VnaHQg
dG8gYmUgdXNlZCBvbiBhbnkgb3RoZXIgZGV2aWNlcy4gSSBndWVzcwp0aGUgb21pc3Npb24gb2Yg
dGhlIGNoZWNrIGdvZXMgYmFjayB0byBhc3N1bWluZyBzYW5lIERvbTAKYmVoYXZpb3IsIHByb3Bl
cmx5IGRlLWFzc2lnbmluZyBkZXZpY2VzIGJlZm9yZSBob3QtdW5wbHVnZ2luZwp0aGVtLCBhbmQg
aGVuY2UgYmVmb3JlIGludm9raW5nIHRoZSByZXNwZWN0aXZlIHBoeXNkZXYtb3BzLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
