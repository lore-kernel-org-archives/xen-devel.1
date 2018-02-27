From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 3/6] x86: Handle the Xen MSRs via the new
 guest_{rd, wr}msr() infrastructure
Date: Tue, 27 Feb 2018 14:30:32 +0000
Message-ID: <20180227143032.zcgqfopjrocwswqg@MacBook-Pro-de-Roger.local>
References: <1519666519-16311-1-git-send-email-andrew.cooper3@citrix.com>
 <1519666519-16311-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1519666519-16311-4-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMjYsIDIwMTggYXQgMDU6MzU6MTZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBEaXNwYXRjaCBmcm9tIHRoZSBndWVzdF97cmQsd3J9bXNyKCkgZnVuY3Rpb25zLCBh
ZnRlciBmYWxsaW5nIHRocm91Z2ggZnJvbSB0aGUKPiAhaXNfdmlyaWRpYW5fZG9tYWluKCkgY2Fz
ZS4KPiAKPiBSZW5hbWUge3JkLHdyfW1zcl9oeXBlcnZpc29yX3JlZ3MoKSB0byBndWVzdF97cmQs
d3J9bXNyX3hlbigpIGZvciBjb25zaXN0ZW5jeSwKPiBhbmQgYmVjYXVzZSB0aGUgX3JlZ3Mgc3Vm
Zml4IGlzbid0IHZlcnkgYXBwcm9wcmlhdGUuCj4gCj4gVXBkYXRlIHRoZW0gdG8gdGFrZSBhIHZj
cHUgcG9pbnRlciByYXRoZXIgdGhhbiBwcmVzdW1pbmcgdGhhdCB0aGV5IGFjdCBvbgo+IGN1cnJl
bnQsIGFuZCBzd2l0Y2ggdG8gdXNpbmcgWDg2RU1VTF8qIHJldHVybiB2YWx1ZXMuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJl
dmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tc3IuYyBiL3hlbi9hcmNoL3g4Ni9tc3IuYwo+IGluZGV4
IDJmZjkzNjEuLjlmMjBmZDggMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L21zci5jCj4gKysr
IGIveGVuL2FyY2gveDg2L21zci5jCj4gQEAgLTE4Myw2ICsxODMsMTAgQEAgaW50IGd1ZXN0X3Jk
bXNyKGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdCBtc3IsIHVpbnQ2NF90ICp2YWwpCj4g
ICAgICAgICAgfQo+ICAKPiAgICAgICAgICAvKiBGYWxsdGhyb3VnaC4gKi8KPiArICAgIGNhc2Ug
MHg0MDAwMDIwMCAuLi4gMHg0MDAwMDJmZjoKPiArICAgICAgICByZXQgPSBndWVzdF9yZG1zcl94
ZW4odiwgbXNyLCB2YWwpOwo+ICsgICAgICAgIGdvdG8gb3V0Owo+ICsKPiAgICAgIGRlZmF1bHQ6
Cj4gICAgICAgICAgcmV0dXJuIFg4NkVNVUxfVU5IQU5ETEVBQkxFOwo+ICAgICAgfQo+IEBAIC0y
NzQsNiArMjc4LDEwIEBAIGludCBndWVzdF93cm1zcihzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3Qg
bXNyLCB1aW50NjRfdCB2YWwpCj4gICAgICAgICAgfQo+ICAKPiAgICAgICAgICAvKiBGYWxsdGhy
b3VnaC4gKi8KPiArICAgIGNhc2UgMHg0MDAwMDIwMCAuLi4gMHg0MDAwMDJmZjoKCkEgZGVmaW5l
IHdvdWxkIGJlIGJldHRlciBpbiBvcmRlciB0byBwcmV2ZW50IHRoaXMgdHdvIHZhbHVlcyBmcm9t
CmdldHRpbmcgb3V0IG9mIHN5bmMgd2l0aCB0aGUgb25lcyBpbiByZG1zciBtYXliZS4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
