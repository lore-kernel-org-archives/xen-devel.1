From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC 31/49] xen/sched: use sched_resource cpu
 instead smp_processor_id in schedulers
Date: Fri, 29 Mar 2019 19:36:40 +0000
Message-ID: <6ae60c7f-e295-d758-cf60-9f24113236e1@citrix.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-32-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/vMr=SA=citrix.com=prvs=9848b938e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h9xJ1-00060X-Fd
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 19:36:47 +0000
In-Reply-To: <20190329150934.17694-32-jgross@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDMvMjAxOSAxNTowOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4gaW5kZXggOWI1
NTI3YzFlYi4uMGI1ZTVlNTY2YiAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMK
PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBAQCAtMzQ3LDcgKzM0Nyw3IEBAIGludCBz
Y2hlZF9pbml0X3ZjcHUoc3RydWN0IHZjcHUgKnYpCj4gICAgICBpZiAoIChpdGVtID0gc2NoZWRf
YWxsb2NfaXRlbSh2KSkgPT0gTlVMTCApCj4gICAgICAgICAgcmV0dXJuIDE7Cj4gIAo+IC0gICAg
aWYgKCBpc19pZGxlX2RvbWFpbihkKSB8fCBkLT5pc19waW5uZWQgKQo+ICsgICAgaWYgKCBpc19p
ZGxlX2RvbWFpbihkKSApCj4gICAgICAgICAgcHJvY2Vzc29yID0gdi0+dmNwdV9pZDsKPiAgICAg
IGVsc2UKPiAgICAgICAgICBwcm9jZXNzb3IgPSBzY2hlZF9zZWxlY3RfaW5pdGlhbF9jcHUodik7
CgpUaGlzIGxvb2tzIGxpa2UgYSBzcHVyaW91cyBjaGFuZ2UuwqAgSSBhbHNvIGRvbid0IGFuIG9i
dmlvdXMgb3RoZXIgcGF0Y2gKdGhhdCBpdCBtaWdodCBmaXQgaW50by4KCkFzIGZvciB0aGUgZmll
bGQgaXRzZWxmLCBpdCBpcyBhbHNvIGZhaXJseSBvYmplY3Rpb25hYmxlLsKgIEl0IGlzIG9ubHkK
ZXZlciBzZXQgZm9yIHRoZSBoYXJkd2FyZSBkb21haW4sIGFuZCBvbmx5IGlmIGRvbTBfdmNwdXNf
cGluIGlzIHVzZWQsCmJ1dCB0aGUgYWN0dWFsIHBpbm5pbmcgaW5mb3JtYXRpb24gaXMgYWxzbyBy
ZWZsZWN0ZWQgaW4gZG9tMCdzIGhhcmQKYWZmaW5pdHkgbWFzay4KCkluIHByYWN0aWNlLCBhbGwg
dGhpcyBmbGFnIGRvZXMgaXMgcGVybWl0IHRoZSB1c2Ugb2YgVkNQVU9QX2dldF9waHlzaWQsCmRp
c2FsbG93IHRoZSB1c2Ugb2YgdmNwdV9zZXRfaGFyZF9hZmZpbml0eSgpLCBhbmQgYWxsb3cgZG9t
MCB0byBhdHRlbXB0CnRvIGFjdHVhbGx5IHdyaXRlIHRvIE1TUl9BTUQ2NF9OQl9DRkcsIE1TUl9G
QU0xMEhfTU1JT19DT05GX0JBU0UsCk1TUl9JQTMyX1VDT0RFX1JFViwgTVNSX0lBMzJfVEhFUk1f
Q09OVFJPTCBhbmQKTVNSX0lBMzJfRU5FUkdZX1BFUkZfQklBUywgcmF0aGVyIHRoYW4gaGF2aW5n
IHRoZSB3cml0ZSBzaWxlbnRseSBkaXNjYXJkZWQuCgpEb20wJ3MgdXNlIG9mIHRob3NlIE1TUnMg
aXMgZHViaW91cyBhdCBiZXN0LCBhbmQgZGlzYWJsZWQgYnkgZGVmYXVsdCwKKmFuZCogd2hlbiBh
Y3RpdmUsIGFsc28gY3Jvc3MtY2hlY2tzIHdpdGggdGhlIGhhcmQgYWZmaW5pdHkgbWFzay7CoCBE
b2VzCmFueW9uZSB1c2UgZG9tMF92Y3B1c19waW4gaW4gcHJvZHVjdGlvbj8KCkkgdGhpbmsgdGhl
cmUgaXMgcXVpdGUgYSBsb3Qgb2YgdmFsdWUgaW4gZ2V0dGluZyByaWQgb2YgZC0+aXNfcGlubmVk
IGFuZAppc19waW5uZWRfdmNwdSgpIGVudGlyZWx5LCB3aXRoIHdpbGwgcmVtb3ZlIGFuIGV4dHJl
bWUKY29ybmVyLWNhc2UteDg2LWlzbSBvdXQgb2YgdGhlIGNvbW1vbiBjb2RlLgoKfkFuZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
