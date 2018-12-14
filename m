From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/3] x86/svm: Improve diagnostics when
 svm_get_insn_len() fails
Date: Fri, 14 Dec 2018 03:16:58 -0700
Message-ID: <5C13831A0200007800206190@prv1-mh.provo.novell.com>
References: <1544732572-29794-1-git-send-email-andrew.cooper3@citrix.com>
 <1544732572-29794-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1544732572-29794-3-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjEyLjE4IGF0IDIxOjIyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vZW11bGF0ZS5jCj4gKysrIGIveGVuL2Fy
Y2gveDg2L2h2bS9zdm0vZW11bGF0ZS5jCj4gQEAgLTE0Myw4ICsxNDMsMTcgQEAgaW50IHN2bV9n
ZXRfaW5zbl9sZW4oc3RydWN0IHZjcHUgKnYsIGVudW0gaW5zdHJ1Y3Rpb25faW5kZXggaW5zbikK
PiAgICAgIH0KPiAgCj4gICAgICBnZHByaW50ayhYRU5MT0dfV0FSTklORywKPiAtICAgICAgICAg
ICAgICIlczogTWlzbWF0Y2ggYmV0d2VlbiBleHBlY3RlZCBhbmQgYWN0dWFsIGluc3RydWN0aW9u
OiAiCj4gLSAgICAgICAgICAgICAiZWlwID0gJWx4XG4iLCAgX19mdW5jX18sICh1bnNpZ25lZCBs
b25nKXZtY2ItPnJpcCk7Cj4gKyAgICAgICAgICAgICAiJXM6IE1pc21hdGNoIGJldHdlZW4gZXhw
ZWN0ZWQgYW5kIGFjdHVhbCBpbnN0cnVjdGlvbjpcbiIsCj4gKyAgICAgICAgICAgICBfX2Z1bmNf
Xyk7CgpJcyBfX2Z1bmNfXyByZWFsbHkgdXNlZnVsIGluIGEgZ2RwcmludGsoKT8KCj4gKyAgICBn
ZHByaW50ayhYRU5MT0dfV0FSTklORywKPiArICAgICAgICAgICAgICIgIGluc25faW5kZXggJWQs
IG9wY29kZSAlI3ggbW9kcm0gJSN4XG4iLAo+ICsgICAgICAgICAgICAgaW5zbiwgb3BjX3RhYltp
bnNuXS5vcGNvZGUsICgob3BjX3RhYltpbnNuXS5tb2RybS5ybSAgPDwgNikgfAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAob3BjX3RhYltpbnNuXS5tb2RybS5y
ZWcgPDwgMykgfAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAo
b3BjX3RhYltpbnNuXS5tb2RybS5tb2QpKSk7CgpUaGlzIGlzIGdvaW5nIHRvIGJlIG1pc2xlYWRp
bmcgd2hlbiBiaXQgMyBvZiBtb2RybS5yZWcgb3IgbW9kcm0ucm0KYXJlIHNldC4KCj4gKyAgICBn
ZHByaW50ayhYRU5MT0dfV0FSTklORywgIiAgcmlwICUjbHgsIG5leHRyaXAgJSNseCwgbGVuICVs
dVxuIiwKPiArICAgICAgICAgICAgIHZtY2ItPnJpcCwgdm1jYi0+bmV4dHJpcCwgdm1jYi0+bmV4
dHJpcCAtIHZtY2ItPnJpcCk7CgpJZiB5b3UgZmluZCBpdCBuZWNlc3NhcnkgdG8gbG9nIHRoZSBs
ZW5ndGggaGVyZSBpbiB0aGUgZmlyc3QgcGxhY2UsIGlzCnRoZXJlIGFueSByZWFzb24gbm90IHRv
IHVzZSBucmlwX2xlbiBoZXJlPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
