From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 07/15] argo: implement the register op
Date: Mon, 28 Jan 2019 04:19:50 -0700
Message-ID: <5C4EE5560200007800211AA6@prv1-mh.provo.novell.com>
References: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
 <1548295503-15946-8-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1go4xI-0007xq-96
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 11:19:56 +0000
In-Reply-To: <1548295503-15946-8-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjAxLjE5IGF0IDAzOjA0LCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IEBAIC0zMSwxMyArMzIsMjcgQEAKPiAgI2lmZGVmIENPTkZJR19DT01QQVQKPiAg
I2luY2x1ZGUgPGNvbXBhdC9hcmdvLmg+Cj4gIENIRUNLX2FyZ29fYWRkcjsKPiArQ0hFQ0tfYXJn
b19yZWdpc3Rlcl9yaW5nOwo+ICBDSEVDS19hcmdvX3Jpbmc7Cj4gICNlbmRpZgoKV2hhdCBhYm91
dCBzdHJ1Y3QgeGVuX2FyZ29fcmluZ19tZXNzYWdlX2hlYWRlcj8KCj4gLS0tIGEveGVuL2luY2x1
ZGUveGxhdC5sc3QKPiArKysgYi94ZW4vaW5jbHVkZS94bGF0LmxzdAo+IEBAIC0xNTAsMyArMTUw
LDQgQEAKPiAgPwlmbGFza190cmFuc2l0aW9uCQl4c20vZmxhc2tfb3AuaAo+ICA/CWFyZ29fYWRk
cgkJCWFyZ28uaAo+ICA/CWFyZ29fcmluZwkJCWFyZ28uaAo+ICs/CWFyZ29fcmVnaXN0ZXJfcmlu
ZwkJYXJnby5oCgpUaGlzIGluc2VydGlvbiB3YW50cyB0byBtb3ZlIHVwIGEgbGluZSAocmVsYXRp
dmUgdG8gdGhlIGFyZ28Kb25lcyB3aGljaCBhcmUgYWxyZWFkeSB0aGVyZSkgYXMgd2VsbCwgdG8g
Zml0IHRoZSBzZWNvbmRhcnkKc29ydGluZyBieSBzdHJ1Y3R1cmUgbmFtZS4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
