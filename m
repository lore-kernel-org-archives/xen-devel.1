From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/pv: Clean up cr3 handling in
 arch_set_info_guest()
Date: Thu, 24 Jan 2019 22:10:41 +0000
Message-ID: <09c39607-ed40-ab4f-7e0c-12f9207636b6@citrix.com>
References: <1545399965-5174-1-git-send-email-andrew.cooper3@citrix.com>
 <ee8053c9-467f-f1a8-5d83-5c69a766d17d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ee8053c9-467f-f1a8-5d83-5c69a766d17d@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDEvMjAxOSAyMTo0MiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJldywKPgo+
IE9uIDEyLzIxLzE4IDE6NDYgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IEFsbCBvZiB0aGlz
IGNvZGUgbGl2ZXMgaW5zaWRlIENPTkZJR19QViB3aGljaCBtZWFucyBnZm4gPT0gbWZuLCBhbmQg
dGhlCj4+IGZpbGxfcm9fbXB0KCkgY2FsbHMgY2xlYXJseSBzaG93IHRoYXQgdGhlIHZhbHVlIGlz
IHVzZWQgdW50cmFuc2xhdGVkLgo+Pgo+PiBDaGFuZ2UgY3IzX2dmbiB0byBhIHN1aXRhYmx5IHR5
cGVkIGNyM19tZm4sIGFuZCByZXBsYWNlCj4+IGdldF9wYWdlX2Zyb21fZ2ZuKCkKPj4gd2l0aCBh
IHN0cmFpZ2h0IG1mbl90b19wYWdlL2dldF9wYWdlIHNlcXVlbmNlLCB0byBhdm9pZCB0aGUKPj4g
aW1wbGljYXRpb24gdGhhdAo+PiB0cmFuc2xhdGlvbiBpcyBnb2luZyBvbi4KPj4KPj4gTm8gZnVu
Y3Rpb25hbCBjaGFuZ2UuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+IC0tLQo+PiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPgo+PiBDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPj4gQ0M6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+PiBDQzogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+PiBDQzogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KPj4KPj4gSnVsaWVuOiBUaGlzIHNob3VsZCBzaW1wbGlmeSB5b3Vy
ICJ4ZW46IFN3aXRjaCBwYXJhbWV0ZXIgaW4KPj4gZ2V0X3BhZ2VfZnJvbV9nZm4KPj4gdG8gdXNl
IHR5cGVzYWZlIGdmbiIgcGF0Y2guwqAgSW4gcGFydGljdWxhciwgSSBkaWQgYSBkb3VibGV0YWtl
IGF0Cj4+IGZpbGxfcm9fbXB0KF9tZm4oZ2ZuX3goY3IzX2dmbikpKTsgd2hlbiByZXZpZXdpbmcg
aXQuCj4KPiBJIHdhcyBsb29raW5nIGF0IHVwZGF0aW5nIG15IHBhdGNoIGFuZCByZW1lbWJlcmVk
IHlvdSBzdWdnZXN0ZWQgdG8KPiByZWJhc2Ugb24gdG9wIG9mIHRoaXMuIERvIHlvdSBoYXZlIGFu
eSBwbGFuIHRvIHJlc2VuZCB0aGUgcGF0Y2g/CgpJJ2xsIHNlZSBpZiBJIGNhbiBmaW5kIHNvbWUg
dGltZSB0b21vcnJvdy4KCn5BbmRyZXcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
