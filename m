From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1 1/4] xen: add hypercall for getting
 parameters at runtime
Date: Tue, 19 Mar 2019 02:36:55 -0600
Message-ID: <5C90AA270200007800220271@prv1-mh.provo.novell.com>
References: <20190306125832.93901vliaskovitis@suse.com>
 <20190306125832.93902vliaskovitis@suse.com>
 <5C89313F020000780021E497@suse.com>
 <cea582cc2d10bfff1f3932df582d7369a59609a4.camel@suse.com>
 <5C8FA508020000780021FE6B@suse.com>
 <bc2190c092ead3c29167b0ca3417e01afcfdec2f.camel@suse.com>
 <5C8FCEF1020000780021FFF5@suse.com>
 <3583ae25-8843-d4b5-3ab3-27e1f4f76455@suse.com>
 <5C90A28F0200007800220205@suse.com>
 <de1241e3-e060-7391-92b0-c809c637dc3c@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a8QS=RW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h6AF8-0001ly-8B
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 08:37:06 +0000
In-Reply-To: <de1241e3-e060-7391-92b0-c809c637dc3c@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Vasilis Liaskovitis <vliaskovitis@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAzLjE5IGF0IDA5OjEyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
OS8wMy8yMDE5IDA5OjA0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTkuMDMuMTkgYXQg
MDc6MDcsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gV2h5IGRvbid0IHdlIHJlcGxhY2Ug
dGhlICIqZ2V0X2Z1bmMoKSIgd2l0aCBhICJjaGFyICpjdXJyZW50X3ZhbCIgYmVpbmcKPj4+IGZp
bGxlZCBhdCBwYXJhbWV0ZXIgc2V0dGluZyB0aW1lPyBIb3cgY3VycmVudF92YWwgaXMgYWxsb2Nh
dGVkIChzdGF0aWMKPj4+IHN0cmluZyBvciBkeW5hbWljIGJ1ZmZlcikganVzdCBoYXMgdG8gYmUg
a25vd24gYnkgdGhlIGN1c3RvbSBwYXJhbWV0ZXIKPj4+IHBhcnNpbmcgZnVuY3Rpb24uCj4+IAo+
PiBDb3VsZCBhY2N1bXVsYXRlIChvdmVyIHRpbWUpIHRvIHF1aXRlIGEgYml0IG9mIHdhc3RlZCBh
bGxvY2F0aW9ucyBpZgo+PiBuby1vbmUgZXZlciBjYXJlcyBhYm91dCBjYWxsaW5nIHRoZSBuZXcg
c3lzY3RsLgo+IAo+IEluIHRoZSBub3JtYWwgY2FzZSB0aGUgbmVlZGVkIG1lbW9yeSBzaG91bGRu
J3QgYmUgbW9yZSB0aGFuIHRoYXQgb2YgdGhlCj4gYm9vdCBwYXJhbWV0ZXJzLCBtYXliZSBwbHVz
IHNvbWUgYnl0ZXMgaW4gY2FzZSBydW50aW1lIHBhcmFtZXRlcnMgYXJlCj4gc2V0LiBTbyBJIGJl
bGlldmUgd2UgYXJlIHRhbGtpbmcgYWJvdXQgbGVzcyB0aGFuIG9uZSBtZW1vcnkgcGFnZS4KClRv
dGFsIHNwYWNlIG5lZWRlZCBtYXkgKGZvciBub3cpIGluZGVlZCBub3QgYmUgdmVyeSBtdWNoLCBi
dXQKc2V0dGluZyB0aGlzIHVwIHdvdWxkIHN0aWxsIGJlIHVzZWxlc3MgaWYgdGhlIHN5c2N0bCB3
YXMgbmV2ZXIKaW52b2tlZCwgYW5kIHByb25lIHRvIGJlIGZvcmdvdHRlbiB0byB1cGRhdGUgd2hl
biBvdGhlciBwYXJ0cwpvZiB0aGF0IGNvbW1hbmQgbGluZSBvcHRpb24ncyBoYW5kbGluZyBnZXQg
dXBkYXRlZC4gSSB0aGluawp0aGVyZSdzIGxlc3MgcmlzayBvZiByZXR1cm5pbmcgc3RhbGUgZGF0
YSBpZiB0aGUgc3RyaW5nIGdldHMgcmUtCmNvbnN0cnVjdGVkIG9uIGRlbWFuZC4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
