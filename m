From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/compat: fix compilation errors with
	clang 6
Date: Wed, 24 Jan 2018 00:58:36 -0700
Message-ID: <5A684ABC02000078001A1CAC@prv-mh.provo.novell.com>
References: <20180123143637.73952-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=5p9l=et=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eeFxD-0006eR-1l
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 07:58:43 +0000
In-Reply-To: <20180123143637.73952-1-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE4IGF0IDE1OjM2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoZSBmb2xsb3dpbmcgZXJyb3JzIGFyZSBnZW5lcmF0ZWQgd2hlbiBjb21waWxpbmcgWGVuIHdp
dGggY2xhbmcgNjoKPiAKPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20geDg2XzY0L2FzbS1vZmZzZXRz
LmM6OToKPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL3Jvb3Qvc3JjL3hlbi94ZW4vaW5jbHVkZS94
ZW4vc2NoZWQuaDo4Ogo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAvcm9vdC9zcmMveGVuL3hlbi9p
bmNsdWRlL3hlbi9zaGFyZWQuaDo2Ogo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAvcm9vdC9zcmMv
eGVuL3hlbi9pbmNsdWRlL2NvbXBhdC9hcmNoLXg4Ni8uLi94ZW4uaDo5Ogo+IC9yb290L3NyYy94
ZW4veGVuL2luY2x1ZGUvY29tcGF0L2FyY2gteDg2L3hlbi5oOjEwOjEwOiBlcnJvcjogdGhlIGN1
cnJlbnQgCj4gI3ByYWdtYSBwYWNrIGFsaWdtZW50Cj4gICAgICAgdmFsdWUgaXMgbW9kaWZpZWQg
aW4gdGhlIGluY2x1ZGVkIGZpbGUgWy1XZXJyb3IsLVdwcmFnbWEtcGFja10KPiAjaW5jbHVkZSAi
eGVuLXg4Nl8zMi5oIgo+ICAgICAgICAgIF4KPiAvcm9vdC9zcmMveGVuL3hlbi9pbmNsdWRlL2Nv
bXBhdC9hcmNoLXg4Ni94ZW4teDg2XzMyLmg6NDA6OTogbm90ZTogcHJldmlvdXMgCj4gJyNwcmFn
bWEgcGFjaycKPiAgICAgICBkaXJlY3RpdmUgdGhhdCBtb2RpZmllcyBhbGlnbm1lbnQgaXMgaGVy
ZQo+ICNwcmFnbWEgcGFjaygpCj4gICAgICAgICBeCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHg4
Nl82NC9hc20tb2Zmc2V0cy5jOjk6Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9yb290L3NyYy94
ZW4veGVuL2luY2x1ZGUveGVuL3NjaGVkLmg6ODoKPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL3Jv
b3Qvc3JjL3hlbi94ZW4vaW5jbHVkZS94ZW4vc2hhcmVkLmg6NjoKPiAvcm9vdC9zcmMveGVuL3hl
bi9pbmNsdWRlL2NvbXBhdC9hcmNoLXg4Ni8uLi94ZW4uaDo5OjEwOiBlcnJvcjogdGhlIGN1cnJl
bnQgCj4gI3ByYWdtYSBwYWNrIGFsaWdtZW50Cj4gICAgICAgdmFsdWUgaXMgbW9kaWZpZWQgaW4g
dGhlIGluY2x1ZGVkIGZpbGUgWy1XZXJyb3IsLVdwcmFnbWEtcGFja10KPiAjaW5jbHVkZSAiYXJj
aC14ODYveGVuLmgiCj4gICAgICAgICAgXgo+IC9yb290L3NyYy94ZW4veGVuL2luY2x1ZGUvY29t
cGF0L2FyY2gteDg2L3hlbi5oOjcxOjk6IG5vdGU6IHByZXZpb3VzIAo+ICcjcHJhZ21hIHBhY2sn
IGRpcmVjdGl2ZSB0aGF0Cj4gICAgICAgbW9kaWZpZXMgYWxpZ25tZW50IGlzIGhlcmUKPiAjcHJh
Z21hIHBhY2soKQo+ICAgICAgICAgXgo+IDIgZXJyb3JzIGdlbmVyYXRlZC4KPiAKPiBGaXggdGhp
cyBieSB1c2luZyBwcmFnbWEgcHVzaC9wb3AgaW4gb3JkZXIgdG8gc3RvcmUgdGhlIGN1cnJlbnQg
cHJhZ21hCj4gdmFsdWUgaW4gdGhlIGNvbXBpbGVyIHN0YWNrIGFuZCBsYXRlciByZXN0b3Jpbmcg
aXQgd2hlbiB1c2luZyBjbGFuZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
