From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] mm: fix LLVM code-generation issue
Date: Thu, 22 Nov 2018 15:57:07 +0100
Message-ID: <20181122145707.cpahvdkdo6p5cnqy@mac>
References: <20181122120327.66403-1-roger.pau@citrix.com>
 <c0b25df2-49ca-fbe1-804a-e1a9839bb854@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mIHh=OB=citrix.com=prvs=8571d395d=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gPqPw-0002Kw-Gp
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 14:57:20 +0000
Content-Disposition: inline
In-Reply-To: <c0b25df2-49ca-fbe1-804a-e1a9839bb854@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMTI6MjM6MjJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyMi8xMS8yMDE4IDEyOjAzLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBM
TFZNIGNvZGUgZ2VuZXJhdGlvbiBjYW4gYXR0ZW1wdCB0byBwZXJmb3JtIGEgbG9hZCBmcm9tIGEg
dmFyaWFibGUgaW4KPiA+IHRoZSBuZXh0IGNvbmRpdGlvbiBvZiBhbiBleHByZXNzaW9uIHVuZGVy
IGNlcnRhaW4gY2lyY3Vtc3RhbmNlcywgdGh1cwo+ID4gdHVybmluZyB0aGUgZm9sbG93aW5nIGNv
bmRpdGlvbjoKPiA+Cj4gPiBpZiAoIHN5c3RlbV9zdGF0ZSA8IFNZU19TVEFURV9hY3RpdmUgJiYg
b3B0X2Jvb3RzY3J1YiA9PSBCT09UU0NSVUJfSURMRSApCj4gPgo+ID4gSW50bzoKPiA+Cj4gPiAw
eGZmZmY4MmQwODAyMjM5NjcgPCsxMDM+OiBjbXBsICAgJDB4MywweDM3YjAzMiglcmlwKSAjIDB4
ZmZmZjgyZDA4MDU5ZTlhMCA8c3lzdGVtX3N0YXRlPgo+ID4gMHhmZmZmODJkMDgwMjIzOTZlIDwr
MTEwPjogc2V0YiAgIC0weDI5KCVyYnApCj4gPiAweGZmZmY4MmQwODAyMjM5NzIgPCsxMTQ+OiBj
bXBsICAgJDB4MiwweDIyOGE4YiglcmlwKSAjIDB4ZmZmZjgyZDA4MDQ0YzQwNCA8b3B0X2Jvb3Rz
Y3J1Yj4KPiAKPiBZb3UncmUgYWN0dWFsbHkgbWlzc2luZyB0d28gcGllY2VzIGhlcmUuwqAgSWYg
SSByZWNhbGwgdGhlIGRpc2Fzc2VtYmx5Cj4gY29ycmVjdGx5LCB0aGVyZSB3YXMgYSBgc2V0ZSAl
YWxgLCBhbmQgYW4gYGFuZCAlYWwsIC0weDI5KCVyYnApYCB3aGljaAo+IGhhZCB0aGUgY3VtdWxh
dGl2ZSBlZmZlY3Qgb2YgY2FsY3VsYXRpbmcgYGlkbGVfc2NydWJgIGJyYW5jaGxlc3NseQo+ICh3
aGljaCBpcyBubyBkb3VidCB0aGUgaW50ZW5kZWQgb3B0aW1pc2F0aW9uKS4KClJpZ2h0LCBteSBw
b2ludCBoZXJlIHdhcyB0byBtZXJlbHkgc2hvdyB0aGF0IG9wdF9ib290c2NydWIgaXMgYWNjZXNz
ZWQKcmVnYXJkbGVzcyBvZiB0aGUgdmFsdWUgb2Ygc3lzdGVtX3N0YXRlLiBJIGNhbiBleHBhbmQg
dGhlIGFzbSBjaHVuaywKYnV0IHRoZSBidWcgcmVmZXJlbmNlIGJlbG93IGFscmVhZHkgaGFzIHRo
ZSBkaXNhc3NlbWJseSBvZiB0aGUgd2hvbGUKZnVuY3Rpb24uCgo+ID4KPiA+IFN1Y2ggY29kZSB3
aWxsIHRyaWdnZXIgYSBwYWdlIGZhdWx0IGlmIHN5c3RlbV9zdGF0ZSA+PQo+ID4gU1lTX1NUQVRF
X2FjdGl2ZS4KPiA+Cj4gPiBJbiBvcmRlciB0byBwcmV2ZW50IHN1Y2ggb3B0aW1pemF0aW9uIHNp
Z25hbCB0byB0aGUgY29tcGlsZXIgdGhhdAo+ID4gYWNjZXNzaW5nIG9wdF9ib290c2NydWIgY2Fu
IGhhdmUgc2lkZSBlZmZlY3RzIGJ5IHVzaW5nIEFDQ0VTU19PTkNFLgo+ID4gVGhpcyBoYXMgYmVl
biByZXBvcnRlZCBhbmQgZGlzY3Vzc2VkIHdpdGggdXBzdHJlYW0gTExWTToKPiA+Cj4gPiBodHRw
czovL2J1Z3MubGx2bS5vcmcvc2hvd19idWcuY2dpP2lkPTM5NzA3CgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
