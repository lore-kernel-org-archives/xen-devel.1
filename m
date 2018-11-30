From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 4/6] microcode: don't call
 apply_microcode() in cpu_request_microcode()
Date: Fri, 30 Nov 2018 02:38:02 -0700
Message-ID: <5C0104FA0200007800201813@prv1-mh.provo.novell.com>
References: <1543383256-12371-1-git-send-email-chao.gao@intel.com>
 <1543383256-12371-5-git-send-email-chao.gao@intel.com>
 <20181128150225.4axdecgu33xlwwzu@mac> <20181129042846.GC23701@gao-cwp>
 <20181129094605.6skmo3xnwmuzwy6y@mac> <20181130085745.GB32365@gao-cwp>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uarp=oj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gSfFM-0004Tk-Sn
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 09:38:04 +0000
In-Reply-To: <20181130085745.GB32365@gao-cwp>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjExLjE4IGF0IDA5OjU3LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBP
biBUaHUsIE5vdiAyOSwgMjAxOCBhdCAxMDo0NjowNUFNICswMTAwLCBSb2dlciBQYXUgTW9ubsOp
IHdyb3RlOgo+Pk9uIFRodSwgTm92IDI5LCAyMDE4IGF0IDEyOjI4OjQ2UE0gKzA4MDAsIENoYW8g
R2FvIHdyb3RlOgo+Pj4gSXQgaXMgYmV0dGVyIHRoYXQgYWxsIENQVXMgaGF2ZSB0aGUgc2FtZSBt
aWNyb2NvZGUgcmV2aXNpb24uIAo+Pj4gCj4+PiBMaW51eCBrZXJuZWwgcmVqZWN0cyBsYXRlIG1p
Y3JvY29kZSB1cGRhdGUgaWYgZmluZGluZyBzb21lIENQVXMKPj4+IG9mZmxpbmVkLiBJIG1heSBw
b3J0IHRoaXMgcGF0Y2ggdG8gWGVuIHRvbyBpbiBhIHNlcGFyYXRlIHBhdGNoLgo+Pgo+PldoYXQg
aGFwcGVucyB3aXRoIGhvdHBsdWcgQ1BVcz8KPj4KPj5FdmVuIGlmIHlvdSBkaXNhYmxlIGxhdGUg
bG9hZGluZyB3aGVuIHRoZXJlIGFyZSBvZmZsaW5lZCBDUFVzIHlvdQo+PnN0aWxsIG5lZWQgdG8g
aGFuZGxlIGhvdHBsdWcgQ1BVcywgd2hpY2ggSU1PIHNob3VsZCBzaGFyZSB0aGUgc2FtZQo+PnBh
dGggd2l0aCBvZmZsaW5lZCBDUFVzOiB0aGUgbWljcm9jb2RlIHVwZGF0ZSBzaG91bGQgYmUgZG9u
ZSBBU0FQCj4+YWZ0ZXIgYnJpbmdpbmcgdGhlIENQVSB1cC4KPiAKPiBJbiBsaW51eCwgQ1BVJ3Mg
YmVpbmcgb2ZmbGluZSBpcyBqdXN0IGEgbG9naWNhbCBvZmZsaW5lLiBJdCBtYXkgcGFydGljaXBh
dGUKPiBhY3Rpb25zIGxpa2UgTUNFLiBJdCB3b3VsZCBsZWFkIHRvIGEgc2l0dWF0aW9uIHRoYXQg
c29tZSBjcHVzIGFyZSB1c2luZyBvbGQKPiBtaWNyb2NvZGUgd2hpbGUgc29tZSBhcmUgdXNpbmcg
dGhlIG5ldyBvbmUsIHdoaWNoIGludHJvZHVjZXMgaW5zdGFiaWxpdHkuCj4gQ1BVIGhvdHBsdWcg
ZG9lc24ndCBoYXZlIHN1Y2ggaXNzdWUuCgpCdXQgcGxlYXNlIGJlIGNhcmVmdWwgbm90IHRvIGRp
c2FsbG93IHVjb2RlIGxvYWRpbmcgaW4gY2FzZXMgd2hlcmUKZG9pbmcgc28gaXMgZmluZS4gSSdt
IGluIHBhcnRpY3VsYXIgdGhpbmtpbmcgYWJvdXQgInNtdD1ubyIsIHdoZXJlCnNlY29uZGFyeSBo
eXBlcnRocmVhZHMgZ2V0IHBhcmtlZC4gU2luY2UgdWNvZGUgdXBkYXRlcyBvbiBvbmUKaHlwZXJ0
aHJlYWQgb2YgYSBjb3JlIGFmZmVjdCBhbGwgaHlwZXJ0aHJlYWRzLCB1cGRhdGluZyBpcyBmaW5l
IGluCnRoaXMgcGFydGljdWxhciBjYXNlLgoKRnVydGhlcm1vcmUsIGlmIHlvdSBsb29rIGF0IG15
IHBhdGNoIHNlcmllcyAieDg2OiBtb3JlIHBvd2VyLQplZmZpY2llbnQgQ1BVIHBhcmtpbmciLCBp
dCBpcyBhbHNvIHdpdGhpbiByZWFsbSBvZiBwb3NzaWJpbGl0eSB0bwpicmllZmx5IHdha2UgdXAg
cGFya2VkIENQVXMsIGp1c3QgdG8gZ2V0IHRoZWlyIHVjb2RlIHVwZGF0ZWQuCgpKYW4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
