From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [OSSTEST PATCH] README.hardware-acquisition [and 1
 more messages] [and 2 more messages]
Date: Fri, 2 Nov 2018 09:19:13 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1811020918060.18518@sstabellini-ThinkPad-X260>
References: <20181030161326.17879-1-ian.jackson@eu.citrix.com>
 <CAFLBxZabx3rG1t8C+6p-+kojxq1WNOqEXn23GyB+w0OgjDYLiQ@mail.gmail.com>
 <CAFLBxZYyKbw3L0p+a9FbLiHy3icSOTPG+Dndk+L1eZjnxaufaA@mail.gmail.com>
 <alpine.DEB.2.10.1810311138360.7220@sstabellini-ThinkPad-X260>
 <CAFLBxZZtiPxCw8Pz4+3JN81ENjzms+qnQEhHBcbJs9FxEP_QXA@mail.gmail.com>
 <18bf9618-d950-8cfa-1746-e330f3ce0e66@arm.com>
 <alpine.DEB.2.10.1810301528180.22840@sstabellini-ThinkPad-X260>
 <23513.52378.653350.705575@mariner.uk.xensource.com>
 <alpine.DEB.2.10.1810310942530.7220@sstabellini-ThinkPad-X260>
 <23514.62634.413212.853593@mariner.uk.xensource.com>
 <alpine.DEB.2.10.1811011051290.7220@sstabellini-ThinkPad-X260>
 <5F35FB3B-9C4F-467C-8461-5201D0BF5E18@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=boe/=nn=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gIcAN-0007fS-Er
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 16:19:23 +0000
In-Reply-To: <5F35FB3B-9C4F-467C-8461-5201D0BF5E18@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>, "stefanos@xilinx.com" <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <dunlapg@umich.edu>, Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>, "infra@xenproject.org" <infra@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyIE5vdiAyMDE4LCBMYXJzIEt1cnRoIHdyb3RlOgo+ICAgICBJIHRob3VnaHQgdGhh
dCB3ZSBjb3VsZCBoYXZlIHByb3ZpZGVkIGEgZGViIHJlcG9zaXRvcnkgd2l0aCBhbHRlcm5hdGl2
ZQo+ICAgICBrZXJuZWxzIGZvciBPU1NUZXN0cyB0byB1c2UuIFdlIHdvdWxkIGhhdmUgc2NyaXB0
cyB0byBnZW5lcmF0ZSB0aG9zZSBkZWIKPiAgICAgcGFja2FnZXMgZnJvbSB0aGUgWGVuIEFSTSBM
aW51eCB0cmVlIGluIGEgcmVwb3NpdG9yeSBvbiB4ZW5iaXRzLCBidXQgd2UKPiAgICAgd291bGRu
J3QgbmVjZXNzYXJpbHkgaGF2ZSBPU1NUZXN0IHJ1biB0aGUgc2NyaXB0LiBJbml0aWFsbHksIHdl
IGNvdWxkCj4gICAgIHJ1biB0aGUgc2NyaXB0cyBieSBoYW5kLCB0aGVuLCB3ZSBjb3VsZCBydW4g
dGhlbSBhdXRvbWF0aWNhbGx5IGluCj4gICAgIE9TU1Rlc3Qgb3IgZWxzZXdoZXJlLiBJcyB0aGF0
IGEgcG9zc2liaWxpdHk/IEkgYWxyZWFkeSBoYXZlIERvY2tlcmZpbGVzCj4gICAgIChBS0EgYmFz
aCBzY3JpcHRzKSB0byBidWlsZCBhbiBBUk0ga2VybmVsIG9uIGEgZmV3IGRpc3Ryb3MsIHRoYXQn
cwo+ICAgICBzb21ldGhpbmcgSSBjb3VsZCBtYWtlIGF2YWlsYWJsZS4KPiAgICAgCj4gICAgIFRo
aXMgbW9ybmluZyBKdWxpZW4gaGFkIG9uZSBtb3JlIGRpZmZlcmVudCBzdWdnZXN0aW9uOiBidWls
ZGluZyB0aGUKPiAgICAga2VybmVsIHdpdGggT1NTVGVzdCBvbiBTb2Z0SXJvbiwgdGhhdCB3ZSBr
bm93IGl0IHdvcmtzLCBpdCB3b3VsZCBiZSBhCj4gICAgIG5hdGl2ZSBjb21waWxhdGlvbi4gVGhl
biB3ZSBjb3VsZCB1c2UgdGhlIGJ1aWx0IGtlcm5lbCB0b2dldGhlciB3aXRoIHRoZQo+ICAgICBE
ZWJpYW4gaW5zdGFsbGVyIG9uIHRoZSBvdGhlciBib2FyZHMgKFhpbGlueCwgUmVuZXNhcywgZXRj
LikKPiAgICAgCj4gICAgIEVpdGhlciB3YXksIHRoZSBrZXJuZWwgdG8gYmUgdXNlZCB3aXRoIHRo
ZSBlbWJlZGRlZCBib2FyZHMgZG9lc24ndCBuZWVkCj4gICAgIHRvIGJlIHJlYnVpbHQgb2Z0ZW4s
IG9ubHkgb25jZSBhIG1vbnRoIG9yIHNvLgo+ICAgICAKPiBUaGF0IHdvdWxkIGZpdCB3aXRoIHRo
ZSBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QveGVuL2NvbnRhaW5lcl9yZWdpc3RyeSBt
b2RlbCAKPiB3aGVyZSB3ZSBzdG9yZSBEb20wIGJhc2VsaW5lcyBhcyBjb250YWluZXJzIGZvciBi
dWlsZHMgdmlhIHRoZSBHaXRsYWIgQ0kgCj4gCj4gVGhpcyBtYXkgYmUgYSBzdHVwaWQgaWRlYSwg
YnV0IEkgd2FudGVkIHRvIG1ha2Ugc3VyZSB0aGF0IHdlIGNvbnNpZGVyIGFsbCBvcHRpb25zCgpU
aGlzIGlzIG5vdCBhIHN0dXBpZCBpZGVhIC0tIGl0IGlzIGV4YWN0bHkgdGhlIGtpbmQgb2YgdGhp
bmcgSSBoYWQgaW4KbWluZCB0b28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
