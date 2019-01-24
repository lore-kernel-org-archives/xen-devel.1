From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH for-4.12] x86/p2m: Drop erroneous
 #VE-enabled check in ept_set_entry()
Date: Thu, 24 Jan 2019 20:40:31 +0200
Message-ID: <77e103d8-d062-b321-570b-64a30ae510b5@bitdefender.com>
References: <1548354483-5021-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1548354483-5021-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMS8yNC8xOSA4OjI4IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IENvZGUgY2xlYXJpbmcg
dGhlICJTdXBwcmVzcyBWRSIgYml0IGluIGFuIEVQVCBlbnRyeSBpc24ndCBuZWNlY3NzZXJpbHkg
cnVubmluZwo+IGluIGN1cnJlbnQgY29udGV4dC4gIEluIEFMVFAyTV9leHRlcm5hbCBtb2RlLCBp
dCBkZWZpbml0ZWx5IGlzIG5vdCwgYW5kIGluIFBWCj4gY29udGV4dCwgdmNwdV9hbHRwMm0oY3Vy
cmVudCkgYWN0cyB1cG9uIHRoZSBIVk0gdW5pb24uCj4gCj4gRXZlbiBpZiB3ZSBjb3VsZCBzZW5z
aWJseSByZXNvbHZlIHRoZSB0YXJnZXQgdkNQVSwgaXQgbWF5IGxlZ2l0aW1hdGVseSBub3QgYmUK
PiBmdWxseSBzZXQgdXAgYXQgdGhpcyBwb2ludCwgc28gcmVqZWN0aW5nIHRoZSBFUFQgbW9kaWZp
Y2F0aW9uIHdvdWxkIGJlIGJ1Z2d5Lgo+IAo+IFRoZXJlIGlzIGEgcGF0aCBpbiBodm1faGFwX25l
c3RlZF9wYWdlX2ZhdWx0KCkgd2hpY2ggZXhwbGljaXRseSBlbXVsYXRlcyAjVkUKPiBpbiB0aGUg
Y3B1X2hhc192bXhfdmlydF9leGNlcHRpb25zIGNhc2UsIHNvIHRoZSAtRU9QTk9UU1VQUCBwYXJ0
IG9mIHRoaXMKPiBjb25kaXRpb24gaXMgYWxzbyB3cm9uZy4KPiAKPiBEcm9wIHRoZSAhc3ZlIGNo
ZWNrIGVudGlyZWx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1
QGJpdGRlZmVuZGVyLmNvbT4KPiBDQzogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwu
Y29tPgo+IENDOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+Cj4gQ0M6IEtl
dmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gQ0M6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IENDOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Cj4gCj4gRGlzY292ZXJlZCB3aGlsZSB0cnlpbmcgdG8gZml4IHRo
ZSBnYXBpbmcgc2VjdXJpdHkgaG9sZSB3aXRoIGJhbGxvb25pbmcgb3V0Cj4gdGhlICNWRSBpbmZv
IHBhZ2UuICBUaGUgcmlzayBmb3IgNC4xMiBpcyB2ZXJ5IG1pbmltYWwgLSBhbHRwMm0gaXMgb2Zm
IGJ5Cj4gZGVmYXVsdCwgbm90IHNlY3VyaXR5IHN1cHBvcnRlZCwgYW5kIHRoZSBhYmlsaXR5IHRv
IGNsZWFyaW5nIHN2ZSBpcyBsaW1pdGVkIHRvCj4gaW50cm9zcGVjdGlvbiBjb2RlIHBhdGhzLgoK
UmV2aWV3ZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4K
CgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
