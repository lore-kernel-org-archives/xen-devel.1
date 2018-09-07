From: "DeGraaf, Daniel G" <dgdegra@nsa.gov>
Subject: Re: [Non-DoD Source] [PATCH 4/5] xen/domain: Fold
 xsm_free_security_domain() paths together
Date: Fri, 7 Sep 2018 20:48:39 +0000
Message-ID: <BA190A75E8413C49BB9E1D2B85D118115587C320@MSMR-GH1-UEA01.corp.nsa.gov>
References: <1535986020-15906-1-git-send-email-andrew.cooper3@citrix.com>
 <1535986020-15906-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535986020-15906-5-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, 'Andrew Cooper' <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50
OiBNb25kYXksIFNlcHRlbWJlciAzLCAyMDE4IDEwOjQ3IEFNDQo+IFRvOiBYZW4tZGV2ZWwgPHhl
bi1kZXZlbEBsaXN0cy54ZW4ub3JnPg0KPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT47IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT47IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4gTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+OyBEYW5pZWwgRGUgR3JhYWYNCj4gPGRn
ZGVncmFAdHljaG8ubnNhLmdvdj4NCj4gU3ViamVjdDogW05vbi1Eb0QgU291cmNlXSBbUEFUQ0gg
NC81XSB4ZW4vZG9tYWluOiBGb2xkIHhzbV9mcmVlX3NlY3VyaXR5X2RvbWFpbigpIHBhdGhzIHRv
Z2V0aGVyDQo+IA0KPiB4c21fZnJlZV9zZWN1cml0eV9kb21haW4oKSBpcyBpZGVtcG90ZW50IChi
b3RoIHRoZSBkdW1teSBoYW5kbGVyLCBhbmQgdGhlDQo+IGZsYXNrIGhhbmRsZXIpLiAgTW92ZSBp
dCBpbnRvIHRoZSBzaGFyZWQgX19kb21haW5fZGVzdHJveSgpIHBhdGgsIGFuZCBkcm9wIHRoZQ0K
PiBJTklUX3hzbSBmbGFnIGZyb20gZG9tYWluX2NyZWF0ZSgpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpBY2tlZC1ieTog
RGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+DQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
