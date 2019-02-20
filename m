From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/4] x86/vmx: Properly flush the TLB when an
 altp2m is modified
Date: Wed, 20 Feb 2019 07:47:34 -0700
Message-ID: <5C6D68860200007800218806@prv1-mh.provo.novell.com>
References: <1550614715-21161-1-git-send-email-andrew.cooper3@citrix.com>
 <1550614715-21161-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1550614715-21161-5-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAyLjE5IGF0IDIzOjE4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTQzMTksMTcgKzQzMjAsNDIgQEAgYm9vbCB2bXhfdm1lbnRlcl9oZWxwZXIoY29u
c3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCj4gIAo+ICAgICAgaWYgKCBwYWdpbmdfbW9k
ZV9oYXAoY3Vyci0+ZG9tYWluKSApCj4gICAgICB7Cj4gLSAgICAgICAgc3RydWN0IGVwdF9kYXRh
ICplcHQgPSAmcDJtX2dldF9ob3N0cDJtKGN1cnItPmRvbWFpbiktPmVwdDsKPiArICAgICAgICBz
dHJ1Y3QgZXB0X2RhdGEgKmVwdCA9ICZwMm1fZ2V0X2hvc3RwMm0oY3VycmQpLT5lcHQ7Cj4gICAg
ICAgICAgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKPiArICAgICAgICB1
bnNpZ25lZCBpbnQgaW52ID0gMDsgLyogTm9uZSA9PiBTaW5nbGUgPT4gQWxsICovCj4gKyAgICAg
ICAgc3RydWN0IGVwdF9kYXRhICpzaW5nbGUgPSBOVUxMOyAvKiBTaW5nbGUgZXB0cCwgaWZmIGlu
diA9PSAxICovCj4gIAo+ICAgICAgICAgIGlmICggY3B1bWFza190ZXN0X2NwdShjcHUsIGVwdC0+
aW52YWxpZGF0ZSkgKQo+ICAgICAgICAgIHsKPiAgICAgICAgICAgICAgY3B1bWFza19jbGVhcl9j
cHUoY3B1LCBlcHQtPmludmFsaWRhdGUpOwo+IC0gICAgICAgICAgICBpZiAoIG5lc3RlZGh2bV9l
bmFibGVkKGN1cnItPmRvbWFpbikgKQo+IC0gICAgICAgICAgICAgICAgX19pbnZlcHQoSU5WRVBU
X0FMTF9DT05URVhULCAwKTsKPiAtICAgICAgICAgICAgZWxzZQo+IC0gICAgICAgICAgICAgICAg
X19pbnZlcHQoSU5WRVBUX1NJTkdMRV9DT05URVhULCBlcHQtPmVwdHApOwo+ICsKPiArICAgICAg
ICAgICAgLyogQXV0b21hdGljYWxseSBpbnZhbGlkYXRlIGFsbCBjb250ZXh0cyBpZiBuZXN0ZWQu
ICovCj4gKyAgICAgICAgICAgIGludiArPSAxICsgbmVzdGVkaHZtX2VuYWJsZWQoY3VycmQpOwo+
ICsgICAgICAgICAgICBzaW5nbGUgPSBlcHQ7Cj4gKyAgICAgICAgfQo+ICsKPiArICAgICAgICBp
ZiAoIGFsdHAybV9hY3RpdmUoY3Vyci0+ZG9tYWluKSApCgpQbGVhc2UgdXNlIGN1cnJkIGhlcmUg
YXMgd2VsbC4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
