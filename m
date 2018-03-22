From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v11 10/12] vpci: add a priority parameter to
 the vPCI register initializer
Date: Thu, 22 Mar 2018 03:57:47 -0600
Message-ID: <5AB38C2B02000078001B4E46@prv-mh.provo.novell.com>
References: <20180320151543.84348-1-roger.pau@citrix.com>
 <20180320151543.84348-11-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhfi=gm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eywym-0002Ir-Gy
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 09:57:52 +0000
In-Reply-To: <20180320151543.84348-11-roger.pau@citrix.com>
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAzLjE4IGF0IDE2OjE1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoaXMgaXMgbmVlZGVkIGZvciBNU0ktWCwgc2luY2UgTVNJLVggd2lsbCBuZWVkIHRvIGJlIGlu
aXRpYWxpemVkCj4gYmVmb3JlIHBhcnNpbmcgdGhlIEJBUnMsIHNvIHRoYXQgdGhlIGhlYWRlciBC
QVIgaGFuZGxlcnMgYXJlIGF3YXJlIG9mCj4gdGhlIE1TSS1YIHJlbGF0ZWQgaG9sZXMgYW5kIG1h
a2Ugc3VyZSB0aGV5IGFyZSBub3QgbWFwcGVkIGluIG9yZGVyIGZvcgo+IHRoZSB0cmFwIGhhbmRs
ZXJzIHRvIHdvcmsgcHJvcGVybHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiAtLS0KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPgo+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+
IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBHZW9y
Z2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xl
LmNvbT4KPiBDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+Cj4gQ2M6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSB2NDoKPiAgLSBBZGQgYSBtaWRk
bGUgcHJpb3JpdHkgYW5kIGFkZCB0aGUgUENJIGhlYWRlciB0byBpdC4KPiAKPiBDaGFuZ2VzIHNp
bmNlIHYzOgo+ICAtIEFkZCBhIG51bWVyaWFsIHN1ZmZpeCB0byB0aGUgc2VjdGlvbiB1c2VkIHRv
IHN0b3JlIHRoZSBwb2ludGVyIHRvCj4gICAgZWFjaCBpbml0aWFsaXplciBmdW5jdGlvbiwgYW5k
IHNvcnQgdGhlbSBhdCBsaW5rIHRpbWUuCj4gLS0tCj4gIHhlbi9hcmNoL2FybS94ZW4ubGRzLlMg
ICAgfCA0ICsrLS0KCkp1bGllbiwgU3RlZmFubz8KClRoYW5rcywgSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
