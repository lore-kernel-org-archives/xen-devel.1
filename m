From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH SpectreV1+L1TF v4 01/11] is_control_domain:
 block speculation
Date: Thu, 24 Jan 2019 20:33:50 +0000
Message-ID: <f905db93-1a63-c60a-1e82-4bb2fef8f7ff@citrix.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244285-30813-2-git-send-email-nmanthey@amazon.de>
 <5C486A2E0200007800210694@prv1-mh.provo.novell.com>
 <ce71286a-12a4-5f1b-0881-1f8c2623caf9@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jbrD=QA=citrix.com=prvs=920b187fd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gmlhC-0008HL-Fh
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 20:33:54 +0000
In-Reply-To: <ce71286a-12a4-5f1b-0881-1f8c2623caf9@amazon.de>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDEvMjAxOSAxMjowNywgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+IE9uIDEvMjMvMTkg
MTQ6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyMy4wMS4xOSBhdCAxMjo1MSwgPG5t
YW50aGV5QGFtYXpvbi5kZT4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbm9zcGVj
LmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9ub3NwZWMuaAo+Pj4gQEAgLTU4LDYgKzU4LDIx
IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBhcnJheV9pbmRleF9tYXNrX25vc3BlYyh1
bnNpZ25lZCBsb25nIGluZGV4LAo+Pj4gICAgICAodHlwZW9mKF9pKSkgKF9pICYgX21hc2spOyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+ICB9KQo+Pj4gIAo+
Pj4gKy8qCj4+PiArICogYWxsb3cgdG8gaW5zZXJ0IGEgcmVhZCBtZW1vcnkgYmFycmllciBpbnRv
IGNvbmRpdGlvbmFscwo+Pj4gKyAqLwo+Pj4gKyNpZmRlZiBDT05GSUdfWDg2Cj4+PiArc3RhdGlj
IGlubGluZSBib29sIGxmZW5jZV90cnVlKHZvaWQpIHsgcm1iKCk7IHJldHVybiB0cnVlOyB9Cj4+
PiArI2Vsc2UKPj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgbGZlbmNlX3RydWUodm9pZCkgeyByZXR1
cm4gdHJ1ZTsgfQo+Pj4gKyNlbmRpZgo+Pj4gKwo+Pj4gKy8qCj4+PiArICogcHJvdGVjdCBldmFs
dWF0aW9uIG9mIGNvbmRpdGlvbmFsIHdpdGggcmVzcGVjdCB0byBzcGVjdWxhdGlvbgo+Pj4gKyAq
Lwo+Pj4gKyNkZWZpbmUgZXZhbHVhdGVfbm9zcGVjKGNvbmRpdGlvbikgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPj4+ICsgICAgKCgoY29uZGl0aW9uKSAmJiBsZmVuY2Vf
dHJ1ZSgpKSB8fCAhbGZlbmNlX3RydWUoKSkKPj4gSXQgbWF5IGJlIGp1c3QgbWUsIGJ1dCBJIHRo
aW5rCj4+Cj4+ICNkZWZpbmUgZXZhbHVhdGVfbm9zcGVjKGNvbmRpdGlvbikgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gICAgICgoY29uZGl0aW9uKSA/IGxmZW5jZV90
cnVlKCkgOiAhbGZlbmNlX3RydWUoKSkKPj4KPj4gd291bGQgYmV0dGVyIGV4cHJlc3MgdGhlIHR3
by13YXkgbmF0dXJlIG9mIHRoaXMuCj4gSSBjb21wYXJlZCB0aGUgYmluYXJ5IG91dHB1dCBvZiB0
aGUgdHdvIHZhcmlhbnRzLCBhbmQgdGhleSBhcmUgdGhlIHNhbWUKPiAoZm9yIG15IGJ1aWxkIGVu
dmlyb25tZW50KS4gSSdsbCBzd2l0Y2ggdG8geW91ciB2YXJpYW50LCBpbiBjYXNlIG5vYm9keQo+
IG9iamVjdHMuCgpJcyBpdCBzYWZlIHRob3VnaD/CoCBUaGUgb3JpZ2luYWwgdmFyaWFudCBpcyBy
ZXF1aXJlZCBieSBDIHRvIG9ubHkKZXZhbHVhdGUgb25lIG9mIHRoZSBsZmVuY2VfdHJ1ZSgpIGJs
b2Nrcywgd2hlcmVhcyB0aGUgc2Vjb25kIHZhcmlhdGlvbgpjb3VsZCBleGVjdXRlIGJvdGggb2Yg
dGhlbSBhbmQgY21vdiB0aGUgMSBhbmQgMCB0b2dldGhlciwgd2hpY2ggaXMgd2FzdGVmdWwuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
