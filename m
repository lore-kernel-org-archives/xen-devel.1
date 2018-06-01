From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/6] x86/vmx: Fix handing of MSR_DEBUGCTL
 on VMExit
Date: Fri, 01 Jun 2018 03:28:09 -0600
Message-ID: <5B1111A902000078001C764A@prv1-mh.provo.novell.com>
References: <1527517678-1779-2-git-send-email-andrew.cooper3@citrix.com>
 <1527701684-4083-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527701684-4083-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA1LjE4IGF0IDE5OjM0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTExNyw2ICsxMTUsOSBAQCBpbnRlZ2VyX3BhcmFtKCJkZWJ1Z19zdGFja19saW5l
cyIsIGRlYnVnX3N0YWNrX2xpbmVzKTsKPiAgc3RhdGljIGJvb2wgb3B0X2xlcjsKPiAgYm9vbGVh
bl9wYXJhbSgibGVyIiwgb3B0X2xlcik7Cj4gIAo+ICsvKiBMYXN0RXhjZXB0aW9uRnJvbUlQIG9u
IHRoaXMgaGFyZHdhcmUuICBaZXJvIGlmIExFUiBpcyBub3QgaW4gdXNlLiAqLwo+ICt1aW50MzJf
dCBfX3JlYWRfbW9zdGx5IGxlcl9tc3I7CgpIbW0sIHRoaXMgaXMgc3RpbGwgdWludDMyX3QgcmF0
aGVyIHRoYW4gdW5zaWduZWQgaW50LCB3aGlsZSB5b3UgZGlkIGNoYW5nZQpjYWxjX2xlcl9tc3Io
KSdzIHJldHVybiB0eXBlLgoKPiArdm9pZCBwZXJjcHVfdHJhcHNfaW5pdCh2b2lkKQo+ICt7Cj4g
KyAgICBzdWJhcmNoX3BlcmNwdV90cmFwc19pbml0KCk7Cj4gKwo+ICsgICAgaWYgKCAhb3B0X2xl
ciApCj4gKyAgICAgICAgcmV0dXJuOwo+ICsKPiArICAgIGlmICggIWxlcl9tc3IgJiYgKGxlcl9t
c3IgPSBjYWxjX2xlcl9tc3IoKSkgKQo+ICsgICAgICAgIHNldHVwX2ZvcmNlX2NwdV9jYXAoWDg2
X0ZFQVRVUkVfWEVOX0xCUik7CgpJIGFzc3VtZSBpdCB3YXMgb24gcHVycG9zZSB0aGF0IHlvdSd2
ZSBhZGp1c3RlZCB0aGUgY29tbWl0IG1lc3NhZ2UKcmF0aGVyIHRoYW4gdGhlIGNvZGUgaGVyZSBy
ZWdhcmRpbmcgdGhlIHBvc3NpYmlsaXR5IG9mIHBvaW50bGVzcyBtdWx0aXBsZQppbnZvY2F0aW9u
PwoKV2l0aCBwcmVmZXJhYmx5IHRoZSB0eXBlIGluY29uc2lzdGVuY3kgYWRkcmVzc2VkClJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
