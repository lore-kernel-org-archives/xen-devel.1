From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 1/6] x86/vvmx: introduce vvmcx_valid()
Date: Thu, 1 Nov 2018 11:15:17 +0000
Message-ID: <bb00a897-6001-a0d7-9a3c-d78d7097831b@citrix.com>
References: <20181012152800.7921-1-sergey.dyasli@citrix.com>
 <20181012152800.7921-2-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181012152800.7921-2-sergey.dyasli@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xen.org
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTAvMTggMTY6MjcsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL2FzbS14ODYvaHZtL25lc3RlZGh2bS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9o
dm0vbmVzdGVkaHZtLmgKPiBpbmRleCA5ZDFjMjc0MmI1Li5lMDlmYTlkNDdkIDEwMDY0NAo+IC0t
LSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL25lc3RlZGh2bS5oCj4gKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9odm0vbmVzdGVkaHZtLmgKPiBAQCAtOTIsNCArOTIsOSBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgbmVzdGVkaHZtX3NldF9jcihzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IGNy
LAo+ICAgICAgICAgIHYtPmFyY2guaHZtLm52Y3B1Lmd1ZXN0X2NyW2NyXSA9IHZhbHVlOwo+ICB9
Cj4gIAo+ICtzdGF0aWMgaW5saW5lIGJvb2wgdnZtY3hfdmFsaWQoY29uc3Qgc3RydWN0IHZjcHUg
KnYpCj4gK3sKPiArICAgIHJldHVybiB2Y3B1X25lc3RlZGh2bSh2KS5udl92dm1jeGFkZHIgIT0g
SU5WQUxJRF9QQUREUjsKPiArfQo+ICsKCk5vdyB0aGF0IFhTQS0yNzggaXMgcHVibGljLCBJIGNh
biBleHBsYWluIHdoeSB0aGlzIHByZWRpY2F0ZSBpcyBhIGxpdHRsZQpicm9rZW4uCgpudl92dm1j
eGFkZHIgZG9lc24ndCBnZXQgaW5pdGlhbGlzZWQgdW50aWwgSFZNX1BBUkFNX05FU1RFRF9WSVJU
IGlzIHNldAp0byAxLgoKQXMgd2l0aCBjL3MgMThjZWY0ZGY4LCBwbGVhc2UgYWRqdXN0IHRoZSB2
Y3B1IGNvbnN0cnVjdGlvbiBwYXRoIHRvIG1ha2UKdGhpcyBwcmVkaWNhdGUgdW5jb25kaXRpb25h
bGx5IHNhZmUgdG8gdXNlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
