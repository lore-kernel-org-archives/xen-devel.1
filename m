From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH svm] svm: fix p2mt type
Date: Tue, 05 Feb 2019 02:33:36 -0700
Message-ID: <5C5958700200007800213E09@prv1-mh.provo.novell.com>
References: <1549355393-7820-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gqx6x-0002ek-JP
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 09:33:47 +0000
In-Reply-To: <1549355393-7820-1-git-send-email-nmanthey@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Michael Tautschnig <tautschn@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAyLjE5IGF0IDA5OjI5LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiAt
LS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0v
c3ZtL3N2bS5jCj4gQEAgLTE3OTQsNyArMTc5NCw3IEBAIHN0YXRpYyB2b2lkIHN2bV9kb19uZXN0
ZWRfcGdmYXVsdChzdHJ1Y3QgdmNwdSAqdiwKPiAgICAgICAgICAgICAgdWludDY0X3QgZ3BhOwo+
ICAgICAgICAgICAgICB1aW50NjRfdCBtZm47Cj4gICAgICAgICAgICAgIHVpbnQzMl90IHF1YWxp
ZmljYXRpb247Cj4gLSAgICAgICAgICAgIHVpbnQzMl90IHAybXQ7Cj4gKyAgICAgICAgICAgIHAy
bV90eXBlX3QgcDJtdDsKPiAgICAgICAgICB9IF9kOwoKUHJhY3RpY2FsbHkgc3BlYWtpbmcgdGhp
cyBzaG91bGQgd29yayBpbiBhbGwgY2FzZXMuIEJ1dCB0aGVyZSdzIHRoZQp0aGVvcmV0aWNhbCBy
aXNrIG9mIHAybV90eXBlX3QgYmVpbmcgYSBkaWZmZXJlbnQgd2lkdGggdGhhbgp1aW50MzJfdC4g
VHJhY2UgcmVjb3JkcyB1c2UgZml4ZWQgd2lkdGggdHlwZXMgc28gdGhhdCBwcm9kdWNlcgphbmQg
Y29uc3VtZXIgY2FuIGJlIGluIHN5bmMgd2l0aCByZXNwZWN0IHRvIGxheW91dC4gVGhlcmVmb3Jl
CkkgdGhpbmsgeW91IHdhbnQgdG8gZ28gdGhyb3VnaCBhbiBpbnRlcm1lZGlhdGUgdmFyaWFibGUg
aW5zdGVhZCwKdGhlIG1vcmUgdGhhdCB0aGVyZSBhbHJlYWR5IGlzIGEgc3VpdGFibGUgb25lLgoK
TWVudGlvbmluZyB0aGUgd29yZCAidHJhY2UiIG9yICJ4ZW50cmFjZSIgaW4gdGhlIHN1YmplY3Qg
bWF5CmFsc28gaGVscCBlYXNpbHkgc2VlaW5nIHdoYXQgdGhlIGlzc3VlIGlzIHdpdGguCgpTVk0g
bWFpbnRhaW5lcnMgLyBHZW9yZ2U6IEkgZmluZCBpdCBvZGQgdGhhdCB0aGVyZSBhcmUgdHdvIGNh
bGxzCnRvIF9fZ2V0X2dmbl90eXBlX2FjY2VzcygpIGhlcmUuIERvZXNuJ3QgdGhpcyBiZWFyIHRo
ZSByaXNrIG9mCnRoZSB0cmFjZSByZWNvcmQgbm90IHJlZmxlY3Rpbmcgd2hhdCBoYXMgYWN0dWFs
bHkgaGFwcGVuZWQgKGkuZS4Kd2hhdCBoYXMgbGVhZCB0byB0aGUgZG9tYWluIGNyYXNoKT8gUGVy
aGFwcyB0aGUgYmV0dGVyIGZpeCBoZXJlCmlzIHRvIHJlbW92ZSB0aGUgc2Vjb25kLCB0cmFjaW5n
IHNwZWNpZmljIGNhbGwgYWx0b2dldGhlcj8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
