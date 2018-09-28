From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] xen: make opt_xen_console true before
 console initialisation
Date: Fri, 28 Sep 2018 10:05:21 -0600
Message-ID: <5BAE514102000078001ECFF0@prv1-mh.provo.novell.com>
References: <20180928082437.15140-1-wei.liu2@citrix.com>
 <20180928082437.15140-3-wei.liu2@citrix.com>
 <5BAE43F202000078001ECF13@prv1-mh.provo.novell.com>
 <20180928151207.kinkppv7klym6zoe@zion.uk.xensource.com>
 <5BAE469C02000078001ECF54@prv1-mh.provo.novell.com>
 <20180928152324.w4rozilb7iajr6qn@zion.uk.xensource.com>
 <20180928155327.ecbrkbcny7luwqxg@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ucvl=mk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g5vGe-0005fw-Ki
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 16:05:24 +0000
In-Reply-To: <20180928155327.ecbrkbcny7luwqxg@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA5LjE4IGF0IDE3OjUzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
QXQgdGhlIG1vbWVudCB0aGUgb3JkZXJpbmcgb2YgdGhlIG9wdGlvbnMgbWF0dGVyLCB3aGljaCBt
ZWFucyBpZiAieGVuIgo+IGlzIG5vdCB0aGUgZmlyc3Qgb3B0aW9uIHdlIGNhbiBsb3NlIG91dHB1
dC4KPiAKPiBJIHRoaW5rIG9uZSBlYXN5IHdheSBvZiBpbXByb3ZpbmcgaXMgdG8gcGFyc2Ugb3B0
X2NvbnNvbGUgdHdpY2UuIFRoZQo+IGZpcnN0IHRpbWUgc29sZWx5IGxvb2tzIGZvciAieGVuIiBh
bmQgdGhlIHNlY29uZCB0aW1lIHBhcnNlcyB0aGUgcmVzdAo+IG9wdGlvbnMuCgpXaGF0J3Mgd3Jv
bmcgd2l0aCBtYWtpbmcgdGhlIHZhcmlhYmxlIGEgdHJpc3RhdGUsIGFuZCBtb3ZlIHlvdXIKc2V0
LXRvLWZhbHNlIGFmdGVyIHRoZSBwYXJzaW5nIGxvb3A/IElmIHRoZSB1c2VyIHNhaWQgImZhbHNl
IiBmb3IgdGhlCm9wdGlvbiwgdGhlbiB0aGV5IGFwcGFyZW50bHkgZG9uJ3QgY2FyZSBtdWNoIGFi
b3V0IHRoZSBvdXRwdXQuCgpCdXQgeWVzLCB3aGF0IHlvdSBzdWdnZXN0IGlzIGFuIG9wdGlvbiBh
cyB3ZWxsLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
