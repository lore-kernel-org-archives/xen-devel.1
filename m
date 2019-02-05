From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH svm] svm: fix p2mt type
Date: Tue, 5 Feb 2019 17:52:24 +0000
Message-ID: <1ec50265-2e06-f614-e5bb-a74b7e7db03f@citrix.com>
References: <1549355393-7820-1-git-send-email-nmanthey@amazon.de>
 <5C5958700200007800213E09@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F64R=QM=citrix.com=prvs=9328585d4=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gr4tj-0007nV-HC
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 17:52:39 +0000
In-Reply-To: <5C5958700200007800213E09@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, nmanthey@amazon.de, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Michael Tautschnig <tautschn@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi81LzE5IDk6MzMgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA1LjAyLjE5IGF0
IDA5OjI5LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2
L2h2bS9zdm0vc3ZtLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMKPj4gQEAg
LTE3OTQsNyArMTc5NCw3IEBAIHN0YXRpYyB2b2lkIHN2bV9kb19uZXN0ZWRfcGdmYXVsdChzdHJ1
Y3QgdmNwdSAqdiwKPj4gICAgICAgICAgICAgIHVpbnQ2NF90IGdwYTsKPj4gICAgICAgICAgICAg
IHVpbnQ2NF90IG1mbjsKPj4gICAgICAgICAgICAgIHVpbnQzMl90IHF1YWxpZmljYXRpb247Cj4+
IC0gICAgICAgICAgICB1aW50MzJfdCBwMm10Owo+PiArICAgICAgICAgICAgcDJtX3R5cGVfdCBw
Mm10Owo+PiAgICAgICAgICB9IF9kOwo+IAo+IFByYWN0aWNhbGx5IHNwZWFraW5nIHRoaXMgc2hv
dWxkIHdvcmsgaW4gYWxsIGNhc2VzLiBCdXQgdGhlcmUncyB0aGUKPiB0aGVvcmV0aWNhbCByaXNr
IG9mIHAybV90eXBlX3QgYmVpbmcgYSBkaWZmZXJlbnQgd2lkdGggdGhhbgo+IHVpbnQzMl90LiBU
cmFjZSByZWNvcmRzIHVzZSBmaXhlZCB3aWR0aCB0eXBlcyBzbyB0aGF0IHByb2R1Y2VyCj4gYW5k
IGNvbnN1bWVyIGNhbiBiZSBpbiBzeW5jIHdpdGggcmVzcGVjdCB0byBsYXlvdXQuIFRoZXJlZm9y
ZQo+IEkgdGhpbmsgeW91IHdhbnQgdG8gZ28gdGhyb3VnaCBhbiBpbnRlcm1lZGlhdGUgdmFyaWFi
bGUgaW5zdGVhZCwKPiB0aGUgbW9yZSB0aGF0IHRoZXJlIGFscmVhZHkgaXMgYSBzdWl0YWJsZSBv
bmUuCj4gCj4gTWVudGlvbmluZyB0aGUgd29yZCAidHJhY2UiIG9yICJ4ZW50cmFjZSIgaW4gdGhl
IHN1YmplY3QgbWF5Cj4gYWxzbyBoZWxwIGVhc2lseSBzZWVpbmcgd2hhdCB0aGUgaXNzdWUgaXMg
d2l0aC4KPiAKPiBTVk0gbWFpbnRhaW5lcnMgLyBHZW9yZ2U6IEkgZmluZCBpdCBvZGQgdGhhdCB0
aGVyZSBhcmUgdHdvIGNhbGxzCj4gdG8gX19nZXRfZ2ZuX3R5cGVfYWNjZXNzKCkgaGVyZS4gRG9l
c24ndCB0aGlzIGJlYXIgdGhlIHJpc2sgb2YKPiB0aGUgdHJhY2UgcmVjb3JkIG5vdCByZWZsZWN0
aW5nIHdoYXQgaGFzIGFjdHVhbGx5IGhhcHBlbmVkIChpLmUuCj4gd2hhdCBoYXMgbGVhZCB0byB0
aGUgZG9tYWluIGNyYXNoKT8gUGVyaGFwcyB0aGUgYmV0dGVyIGZpeCBoZXJlCj4gaXMgdG8gcmVt
b3ZlIHRoZSBzZWNvbmQsIHRyYWNpbmcgc3BlY2lmaWMgY2FsbCBhbHRvZ2V0aGVyPwoKSSdtIHNl
ZWluZyBvbmUgY2FsbCByZWxhdGVkIHRvIHhlbnRyYWNlLCB3aGljaCBoYXBwZW5zIGZpcnN0OyBh
bmQgdGhlbiBhCnNlY29uZCBvbmUgZm9yIHRoZSBnZHByaW50ay4gIEJ5ICJ0cmFjaW5nIHNwZWNp
ZmljIGNhbGwiLCBkbyB5b3UgbWVhbgp0aGUgZ2RwcmludGsgb25lPwoKSXQncyB3b3J0aCBwb2lu
dGluZyBvdXQgdGhhdCBpbiB0aGUgY29tbW9uIGNhc2UsICpuZWl0aGVyKiBjYWxsIHdpbGwKaGFw
cGVuLCBiZWNhdXNlIDEpIHRyYWNpbmcgaXMgZGlzYWJsZWQsIGFuZCAyKSB0aGUgdmFzdCBtYWpv
cml0eSBvZiB0aGUKdGltZSBubyBTVk0gdmlvbGF0aW9ucyB3aWxsIGhhcHBlbi4gIER1cGxpY2F0
aW5nIHRoZSBjYWxsIGlzIHRyYWRpbmcKc3BhY2UgZm9yIGVmZmljaWVuY3kuCgpQcm9iYWJseSB0
aGUgYmVzdCB0aGluZyB0byBkbyB3b3VsZCBiZSB0byBtb3ZlIHRoZQpfX2dldF9nZm5fdHlwZV9h
Y2Nlc3MoKSBjYWxsIHVwIHVuZGVyIHRoZSBpZigpIHN0YXRlbWVudCB0aGVyZSAtLSBpLmUuLApp
dCB3aWxsIG9ubHkgYmUgY2FsbGVkIGlmIHRoZSB0cmFjaW5nIG9uZSBkaWRuJ3QgaGFwcGVuLgoK
IC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
