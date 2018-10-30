From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 7/8] viridian: define type for the 'virtual
 VP assist page'
Date: Tue, 30 Oct 2018 18:08:34 +0100
Message-ID: <20181030170834.4lv6sgvp4ykzn3xv@mac.citrite.net>
References: <20181029180211.2155-1-paul.durrant@citrix.com>
 <20181029180211.2155-10-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rlru=nk=citrix.com=prvs=8342f37c0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gHXVr-0002Zy-0u
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 17:09:07 +0000
Content-Disposition: inline
In-Reply-To: <20181029180211.2155-10-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMjksIDIwMTggYXQgMDY6MDI6MTBQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZSBzcGVjaWZpY2F0aW9uIFsxXSBkZWZpbmVzIGEgdHlwZSBzbyB3ZSBzaG91bGQg
dXNlIGl0LCByYXRoZXIgdGhhbiBqdXN0Cj4gT1ItaW5nIGFuZCBBTkQtaW5nIG1hZ2ljIGJpdHMu
Cj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gTk9URTogVGhlIHR5cGUgZGVmaW5lZCBp
biB0aGUgc3BlY2lmaWNhdGlvbiBkb2VzIGluY2x1ZGUgYW4gYW5vbnltb3VzCj4gICAgICAgc3Vi
LXN0cnVjdCBpbiB0aGUgcGFnZSB0eXBlIGJ1dCwgYXMgd2UgY3VycmVudGx5IHVzZSBvbmx5IHRo
ZSBmaXJzdAo+ICAgICAgIGVsZW1lbnQsIHRoZSBzdHJ1Y3QgZGVjbGFyYXRpb24gaGFzIGJlZW4g
b21pdHRlZC4KPiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL01pY3Jvc29mdERvY3MvVmlydHVh
bGl6YXRpb24tRG9jdW1lbnRhdGlvbi9yYXcvbGl2ZS90bGZzL0h5cGVydmlzb3IlMjBUb3AlMjBM
ZXZlbCUyMEZ1bmN0aW9uYWwlMjBTcGVjaWZpY2F0aW9uJTIwdjUuMEMucGRmCj4gCj4gU2lnbmVk
LW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiAtLS0KPiBD
YzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3N5bmljLmMgIHwgNTIgKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4
Ni9odm0vdmlyaWRpYW4uaCB8ICAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9u
cygrKSwgMjEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0v
dmlyaWRpYW4vc3luaWMuYyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vc3luaWMuYwo+IGlu
ZGV4IDNmMDQzZjM0ZWUuLjczNWM0Yzg5N2MgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2
bS92aXJpZGlhbi9zeW5pYy5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi9zeW5p
Yy5jCj4gQEAgLTEzLDYgKzEzLDE4IEBACj4gICNpbmNsdWRlIDxhc20vYXBpYy5oPgo+ICAjaW5j
bHVkZSA8YXNtL2h2bS9zdXBwb3J0Lmg+Cj4gIAo+ICt0eXBlZGVmIHN0cnVjdCBfSFZfVklSVFVB
TF9BUElDX0FTU0lTVAo+ICt7Cj4gKyAgICB1aW50MzJfdCBub19lb2k6MTsKCk1heWJlIGJvb2w6
MSBzbyB5b3UgY2FuIHVzZSB0cnVlL2ZhbHNlPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
