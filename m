From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/6] x86/VT-x: Fix 64bit HVM guests on
 Harpertown cores
Date: Thu, 3 Jan 2019 11:01:01 +0000
Message-ID: <cca0f85e-91e1-a1d8-9bb3-1c5292420a8c@citrix.com>
References: <1546000776-23378-1-git-send-email-andrew.cooper3@citrix.com>
 <1546000776-23378-7-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1546000776-23378-7-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMTIvMjAxOCAxMjozOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBjL3MgZmQzMmRjZmU0
YyAieDg2L3ZteDogRG9uJ3QgbGVhayBFRkVSLk5YRSBpbnRvIGd1ZXN0IGNvbnRleHQiIGhhZCBh
bgo+IHVuaW50ZW5kZWQgY29uc2VxdWVuY2Ugb24gSGFycGVydG93biBjb3JlcyB3aGljaCwgYXMg
aXQgdHVybnMgb3V0LCBkb24ndAo+IGxvYWQgTVNSX0VGRVIgZnVsbHkgZnJvbSB0aGUgTVNSIExv
YWQgTGlzdCAtIG9uIHJlZW50cnkgdG8gdGhlIGd1ZXN0LAo+IEVGRVIuU0NFIGlzIGNsZWFyIGly
cmVzcGVjdGl2ZSBvZiB0aGUgdmFsdWUgaW4gbG9hZCBsaXN0Lgo+Cj4gVGhpcywgYmVpbmcgY2F0
YXN0cm9waGljIHRvIDY0Yml0IGd1ZXN0cywgaXMgZmFyIHdvcnNlIHRoYW4gdGhlIEVGRVIuTlhF
Cj4gbGVha2FnZSB3aGljaCB3YXMgdHJ5aW5nIHRvIGJlIGZpeGVkLgo+Cj4gSW50cm9kdWNlIGNw
dV9idWdfbXNyX2xsX2VmZXJfc2NlIHRvIGVuY2Fwc3VsYXRlIHRoaXMgcGFydGlhbCByZXZlcnQu
Cj4gQXZvaWQgYWRkaW5nIE1TUl9FRkVSIHRvIHRoZSBMb2FkIExpc3RzIG9uIGltcGFjdGVkIGhh
cmR3YXJlLCBhbmQKPiByZWludHJvZHVjZSB0aGUgbG9naWMgdG8gdXNlIHRoZSBndWVzdHMgRUZF
Ui5TQ0Ugc2V0dGluZy4KPgo+IEluIHRoZSBjb21tb24gY2FzZSBvZiBydW5uaW5nIDY0Yml0IEhW
TSBndWVzdHMsIHRoZXNlIGV4dHJhIGFkanVzdG1lbnRzCj4gdG8gRUZFUiBzaG91bGQgb25seSBi
ZSBoaXQgZHVyaW5nIGd1ZXN0IGJvb3QuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IENDOiBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gQ0M6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IENDOiBKdW4gTmFrYWpp
bWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+Cj4gQ0M6IEtldmluIFRpYW4gPGtldmluLnRpYW5A
aW50ZWwuY29tPgo+Cj4gVGhpcyBpcyBSRkMgYXQgdGhlIG1vbWVudCwgYmVjYXVzZSB0aGUgdGVz
dCBsYWIgaXMgZnVsbCBhdCB0aGUgbW9tZW50Cj4gYW5kIEkgZG9uJ3QgaGF2ZSBhIEhhcnBlcnRv
d24gQ1BVIHRvIGhhbmQuICBJJ20gZmFpcmx5IHN1cmUgdGhlIGNoYW5nZQo+IGlzIGNvbXBsZXRl
IGFuZCB3aWxsIHRlc3Qgd2hlbiBpdCBiZWNvbWVzIGF2YWlsYWJsZSwgYnV0IEkgZG9uJ3QgZXhw
ZWN0Cj4gdG8gbWFrZSBhbnkgY29kZSBjaGFuZ2VzLgoKU2FkbHkgdGVzdGluZyBzYXlzIG5vLsKg
IEknbGwgdHJ5IGFuZCBmaWd1cmUgb3V0IHdoYXQgaXMgZ29pbmcgb24gaGVyZS4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
