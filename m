From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v5 6/9] is_control_domain:
 block speculation
Date: Wed, 06 Feb 2019 08:03:00 -0700
Message-ID: <5C5AF7240200007800214562@prv1-mh.provo.novell.com>
References: <c755dfdd-3c1e-5ccd-983f-11d0b35bb342@suse.com>
 <1548772997-32742-1-git-send-email-nmanthey@amazon.de>
 <1548772997-32742-7-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <010527AF020000F8B1E090C7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1grOjF-00029i-B5
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 15:03:09 +0000
In-Reply-To: <010527AF020000F8B1E090C7@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAxLjE5IGF0IDE1OjQzLCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBA
QCAtOTA4LDEwICs5MDksMTAgQEAgdm9pZCB3YXRjaGRvZ19kb21haW5fZGVzdHJveShzdHJ1Y3Qg
ZG9tYWluICpkKTsKPiAgICogICAgKHRoYXQgaXMsIHRoaXMgd291bGQgbm90IGJlIHN1aXRhYmxl
IGZvciBhIGRyaXZlciBkb21haW4pCj4gICAqICAtIFRoZXJlIGlzIG5ldmVyIGEgcmVhc29uIHRv
IGRlbnkgdGhlIGhhcmR3YXJlIGRvbWFpbiBhY2Nlc3MgdG8gdGhpcwo+ICAgKi8KPiAtI2RlZmlu
ZSBpc19oYXJkd2FyZV9kb21haW4oX2QpICgoX2QpID09IGhhcmR3YXJlX2RvbWFpbikKPiArI2Rl
ZmluZSBpc19oYXJkd2FyZV9kb21haW4oX2QpIGV2YWx1YXRlX25vc3BlYygoX2QpID09IGhhcmR3
YXJlX2RvbWFpbikKPiAgCj4gIC8qIFRoaXMgY2hlY2sgaXMgZm9yIGZ1bmN0aW9uYWxpdHkgc3Bl
Y2lmaWMgdG8gYSBjb250cm9sIGRvbWFpbiAqLwo+IC0jZGVmaW5lIGlzX2NvbnRyb2xfZG9tYWlu
KF9kKSAoKF9kKS0+aXNfcHJpdmlsZWdlZCkKPiArI2RlZmluZSBpc19jb250cm9sX2RvbWFpbihf
ZCkgZXZhbHVhdGVfbm9zcGVjKChfZCktPmlzX3ByaXZpbGVnZWQpCgpJJ20gYWZyYWlkIHRoZXJl
J3MgYW5vdGhlciBmbHkgaW4gdGhlIG9pbnRtZW50IGhlcmU6IFdoaWxlIGxvb2tpbmcgYXQKdGhl
IHN0aWxsIHF1ZXN0aW9uYWJsZSBncmFudCB0YWJsZSBjaGFuZ2UgSSd2ZSBzdGFydGVkIHdvbmRl
cmluZwphYm91dCBjb25zdHJ1Y3RzIGxpa2UKCiAgICBjYXNlIFhFTk1FTV9tYWNocGh5c19tYXBw
aW5nOgogICAgewogICAgICAgIHN0cnVjdCB4ZW5fbWFjaHBoeXNfbWFwcGluZyBtYXBwaW5nID0g
ewogICAgICAgICAgICAudl9zdGFydCA9IE1BQ0gyUEhZU19WSVJUX1NUQVJULAogICAgICAgICAg
ICAudl9lbmQgICA9IE1BQ0gyUEhZU19WSVJUX0VORCwKICAgICAgICAgICAgLm1heF9tZm4gPSBN
QUNIMlBIWVNfTlJfRU5UUklFUyAtIDEKICAgICAgICB9OwoKICAgICAgICBpZiAoICFtZW1faG90
cGx1ZyAmJiBpc19oYXJkd2FyZV9kb21haW4oY3VycmVudC0+ZG9tYWluKSApCiAgICAgICAgICAg
IG1hcHBpbmcubWF4X21mbiA9IG1heF9wYWdlIC0gMTsKICAgICAgICBpZiAoIGNvcHlfdG9fZ3Vl
c3QoYXJnLCAmbWFwcGluZywgMSkgKQogICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKCiAgICAg
ICAgcmV0dXJuIDA7CiAgICB9CgpHcmFudGVkIHRoZSBleGFtcGxlIGhlcmUgY291bGQgYmUgZWFz
aWx5IHJlLWFycmFuZ2VkLCBidXQgdGhlcmUKYXJlIG90aGVycyB3aGVyZSB0aGlzIGlzIGxlc3Mg
ZWFzeSBvciBub3QgcG9zc2libGUgYXQgYWxsLiBXaGF0IEknbQp0cnlpbmcgdG8gZ2V0IGF0IGFy
ZSBjb25zdHJ1Y3RzIHdoZXJlIHRoZSBzdWNoLXByb3RlY3RlZApwcmVkaWNhdGVzIHNpdCBvbiB0
aGUgcmlnaHQgc2lkZSBvZiAmJiBvciB8fCAtIGFmYWljdCAoYWxzbyBmcm9tCmxvb2tpbmcgYXQg
c29tZSBtdWNoIHNpbXBsaWZpZWQgY29kZSBleGFtcGxlcykgdGhlIGludGVuZGVkCnByb3RlY3Rp
b24gaXMgZ29uZSBpbiB0aGVzZSBjYXNlcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
