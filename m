From: luca abeni <luca.abeni@santannapisa.it>
Subject: Re: [PATCH] x86/xen: Add "xen_timer_slop" command line
 option
Date: Mon, 25 Mar 2019 13:05:57 +0100
Message-ID: <20190325130530.56603806__6754.44225068844$1553515625$gmane$org@luca64>
References: <1553279397-130201-1-git-send-email-ryan.thibodeaux@starlab.io>
 <abf65a68-9463-0f0e-1f51-6eefd3cacc88@oracle.com>
 <52bfeae7c256faec444b69efe58d363ad60c3fc5.camel@suse.com>
 <20190323114151.5cebf31b@sweethome>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j4SG=R4=santannapisa.it=luca.abeni@srs-us1.protection.inumbo.net>)
 id 1h8OMf-0003p7-Df
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 12:06:05 +0000
In-Reply-To: <20190323114151.5cebf31b@sweethome>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: jgross@suse.com, oleksandr_andrushchenko@epam.com, linux-kernel@vger.kernel.org, thibodux@gmail.com, ryan.thibodeaux@starlab.io, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKT24gU2F0LCAyMyBNYXIgMjAxOSAxMTo0MTo1MSArMDEwMApsdWNhIGFiZW5pIDxs
dWNhLmFiZW5pQHNhbnRhbm5hcGlzYS5pdD4gd3JvdGU6ClsuLi5dCj4gPiA+IElzIHRoZXJlIGFu
eSBkYXRhIHRoYXQgc2hvd3MgZWZmZWN0cyBvZiB1c2luZyB0aGlzIG5ldyBwYXJhbWV0ZXI/Cj4g
PiA+ICAgICAKPiA+IFllcywgSSd2ZSBkb25lIHNvbWUgcmVzZWFyY2ggYW5kIGV4cGVyaW1lbnRz
IG9uIHRoaXMuIEkgZGlkIGl0Cj4gPiB0b2dldGhlciB3aXRoIGEgZnJpZW5kLCB3aGljaCBJJ20g
Q2MtaW5nLCBhcyBJJ20gbm90IHN1cmUgd2UncmUKPiA+IHJlYWR5L2NhcGFibGUgdG8gc2hhcmUg
dGhlIHJlc3VsdHMsIHlldCAoTHVjYT8pLiAgCj4gCj4gSSB0aGluayB3ZSBjYW4gZWFzaWx5IHNo
YXJlIHRoZSBleHBlcmltZW50YWwgZGF0YSAoY3ljbGljdGVzdCBvdXRwdXQKPiBhbmQgcGxvdHMp
Lgo+IAo+IE1vcmVvdmVyLCB3ZSBjYW4gc2hhcmUgdGhlIHNjcmlwdHMgYW5kIHRvb2xzIGZvciBy
dW5uaW5nIHRoZQo+IGV4cGVyaW1lbnRzIChzbywgZXZlcnlvbmUgY2FuIGVhc2lseSByZXByb2R1
Y2UgdGhlIG51bWJlcnMgYnkgc2ltcGx5Cj4gdHlwaW5nICJtYWtlIiBhbmQgd2FpdGluZyBmb3Ig
c29tZSB0aW1lIDopCj4gCj4gCj4gSSdsbCB0cnkgdG8gcGFja2FnZSB0aGUgcmVzdWx0cyBhbmQg
dGhlIHNjcmlwdHMvdG9vbHMgdGhpcyBldmVuaW5nLAo+IGFuZCBJJ2xsIHNlbmQgdGhlbS4KClNv
cnJ5IGZvciB0aGUgZGVsYXkuIEkgcHV0IHNvbWUgcXVpY2sgcmVzdWx0cyBoZXJlOgpodHRwOi8v
cmV0aXMuc2FudGFubmFwaXNhLml0L2x1Y2EvWGVuVGltZXJzLwoodGhlcmUgYWxzbyBpcyBhIGxp
bmsgdG8gdGhlIHNjcmlwdHMgdG8gYmUgdXNlZCBmb3IgcmVwcm9kdWNpbmcgdGhlCnJlc3VsdHMp
LiBUaGUgbGF0ZW5jaWVzIGhhdmUgYmVlbiBtZWFzdXJlZCBieSBydW5uaW5nIGN5Y2xpY3Rlc3Qg
aW4gdGhlCmd1ZXN0IChzZWUgdGhlIHNjcmlwdHMgZm9yIGRldGFpbHMpLgoKVGhlIHBpY3R1cmUg
c2hvd3MgdGhlIGxhdGVuY2llcyBtZWFzdXJlZCB3aXRoIGFuIHVucGF0Y2hlZCBndWVzdCBrZXJu
ZWwKYW5kIHdpdGggYSBndWVzdCBrZXJuZWwgaGF2aW5nIFRJTUVSX1NMT1Agc2V0IHRvIDEwMDAg
KGFyYml0cmFyeSBzbWFsbAp2YWx1ZSA6KS4KQWxsIHRoZSBleHBlcmltZW50cyBoYXZlIGJlZW4g
cGVyZm9ybWVkIGJvb3RpbmcgdGhlIGh5cGVydmlzb3Igd2l0aCBhCnNtYWxsIHRpbWVyX3Nsb3Ag
KHRoZSBoeXBlcnZpc29yJ3Mgb25lKSB2YWx1ZS4gU28sIHRoZXkgc2hvdyB0aGF0CmRlY3JlYXNp
bmcgdGhlIGh5cGVydmlzb3IncyB0aW1lcl9zbG9wIGlzIG5vdCBlbm91Z2ggdG8gbWVhc3VyZSBs
b3cKbGF0ZW5jaWVzIHdpdGggY3ljbGljdGVzdC4KCgoJCQkJTHVjYQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
