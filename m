From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [PATCH 1/4] x86/vvmx: Unconditionally initialise
 vmxon_region_pa during vcpu construction
Date: Fri, 26 Oct 2018 10:09:16 +0100
Message-ID: <865860f9-da9f-2fb0-e11e-5036ee6db9f2@citrix.com>
References: <1540481802-20037-1-git-send-email-andrew.cooper3@citrix.com>
 <1540481802-20037-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1540481802-20037-2-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMTAvMjAxOCAxNjozNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGlzIGlzIGEgc3Rv
cGdhcCBzb2x1dGlvbiB1bnRpbCB0aGUgdG9vbHN0YWNrIHNpZGUgb2YgaW5pdGlhbGlzYXRpb24g
Y2FuIGJlCj4gc29ydGVkIG91dCwgYnV0IGl0IGRvZXMgcmVzdWx0IGluIHRoZSBudm14X3ZjcHVf
aW5fdm14KCkgcHJlZGljYXRlIHdvcmtpbmcKPiBjb3JyZWN0bHkgZXZlbiB3aGVuIG5lc3RlZCB2
aXJ0IGhhc24ndCBiZWVuIGVuYWJsZWQgZm9yIHRoZSBkb21haW4uCj4gCj4gVXBkYXRlIG52bXhf
aGFuZGxlX3ZteF9pbnNuKCkgdG8gaW5jbHVkZSB0aGUgaW4tdm14IG1vZGUgY2hlY2sgKGZvciBh
bGwKPiBpbnN0cnVjdGlvbnMgb3RoZXIgdGhhbiBWTVhPTikgdG8gY29tcGxldGUgdGhlIHNldCBv
ZiAjVUQgY2hlY2tzLgo+IAo+IEluIGFkZGl0aW9uLCBzYW5pdHkgY2hlY2sgdGhhdCB0aGUgbmVz
dGVkIHZtZXhpdCBoYW5kbGVyIGhhcyB3b3JrZWQgY29ycmVjdGx5LAo+IGFuZCB0aGF0IHdlIGFy
ZSBvbmx5IHByb3ZpZGluZyBlbXVsYXRpb24gb2YgdGhlIFZULXggaW5zdHJ1Y3Rpb25zIHRvIEwx
Cj4gZ3Vlc3RzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNs
aUBjaXRyaXguY29tPgoKLS0KVGhhbmtzLApTZXJnZXkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
