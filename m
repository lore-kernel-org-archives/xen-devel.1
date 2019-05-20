From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] Add TRACKING.IMPORTS to xen.git to more
 easily manage imported files that need to be kept in sync with an upstream
Date: Mon, 20 May 2019 17:36:50 +0100
Message-ID: <23778.55202.449293.616451@mariner.uk.xensource.com>
References: <0648312f1c78e519142ff1829a984e7e965bf3c7.1557957269.git.lars.kurth@citrix.com>
 <5CDD3FA1020000780022F903@prv1-mh.provo.novell.com>
 <530E0649-256F-4A11-B887-E665B3C92979@citrix.com>
 <5CDE6407020000780022FF63@prv1-mh.provo.novell.com>
 <2B55A18B-F04C-4249-8558-11F0A24E312C@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26W0=TU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hSlHx-000425-94
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 16:37:25 +0000
In-Reply-To: <2B55A18B-F04C-4249-8558-11F0A24E312C@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, "committers@xenproject.org" <committers@xenproject.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBnb2luZyBpbiB0aGUgcmlnaHQgZGlyZWN0aW9uIElNTy4KCkxhcnMgS3VydGggd3Jp
dGVzICgiUmU6IFtQQVRDSF0gQWRkIFRSQUNLSU5HLklNUE9SVFMgdG8geGVuLmdpdCB0byBtb3Jl
IGVhc2lseSBtYW5hZ2UgaW1wb3J0ZWQgZmlsZXMgdGhhdCBuZWVkIHRvIGJlIGtlcHQgaW4gc3lu
YyB3aXRoIGFuIHVwc3RyZWFtIik6Cj4gVGhhdCBtYWtlcyBwZXJmZWN0IHNlbnNlIG5vdy4gSW4g
dGhhdCBjYXNlLCBJIHRlbmQgdG8gYWdyZWUgdGhhdCAiYXV0byIgaXMgcHJvYmFibHkgbm90IG5l
ZWRlZC4gV291bGQgYmUgcXVpdGUgaGFwcHkgdG8gZHJvcCBpdC4KCkl0IHdpbGwgY29uc2lkZXJh
Ymx5IGNvbXBsaWNhdGUgdGhpbmdzIHRvIGFkZCBhIHdheSB0byBkZWZpbmUKc2VkZGVyeS4gIExl
dCB1cyBsZWF2ZSB0aGF0IHRvIGEgZnV0dXJlIGV4dGVuc2lvbi4KClRoYXQgc3VnZ2VzdHMgdGhh
dCBgbWFudWFsJyBzaG91bGQgYmVjb21lIGBmaWxlOicuCgpBcyBmb3IgZGVsaW1pdGVycwoKPiDv
u79PbiAxNy8wNS8yMDE5LCAwMTozNCwgIkphbiBCZXVsaWNoIiA8SkJldWxpY2hAc3VzZS5jb20+
IHdyb3RlOgo+ICAgICA+IEkgYW0gbm90IHN1cmUgd2hhdCB5b3UgbWVhbiwgd2hpY2ggY29sb25z
PyBBcmUgeW91IHNheWluZywgdGhlIGZvcm1hdCBzaG91bGQgYmUKPiAgICAgPiB2ZXJzaW9uOiAx
Cj4gICAgID4gcmVwbzogLi4uCj4gICAgIAo+ICAgICBZZXMuIFRoaXMgd291bGQgbWFrZSBpdCBl
dmVuIG1vcmUgcHJvbWluZW50IHRoYXQgdGhlc2UgYXJlIHRhZ3Mgb2YKPiAgICAgc29tZSBzb3J0
LiBCdXQgdGhpcyB3YXMgb25seSBhIHRob3VnaHQgb2YgbWluZSwgaXQncyBpbiBubyB3YXkgbWVh
bnQKPiAgICAgdG8gYmUgYSByZXF1aXJlbWVudCBJIGhhdmUuCgpJdCB3aWxsIG1ha2Ugd3JpdGlu
ZyBhIHBhcnNlciBlYXNpZXIgaWYgZWFjaCBlbnRyeSBpcyBhIHNpbmdsZSBsaW5lCndpdGggdGhl
IGZpZWxkcyBpbiBhIGRlZmluZWQgb3JkZXIgYW5kIGlmIHdlIGNhbiBzYXkgdGhhdCBhIGByZXBv
OicKbXVzdCBwcmVjZWRlIGV2ZXJ5IGBmaWxlOicgdGhhdCBtZW50aW9ucyBpdC4KCklhbi4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
