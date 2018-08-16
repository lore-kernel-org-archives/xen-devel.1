From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/setup: Avoid OoB E820 lookup when
 calculating the L1TF safe address
Date: Thu, 16 Aug 2018 09:57:48 -0600
Message-ID: <5B759EFC02000078001DF02C@prv1-mh.provo.novell.com>
References: <1534433277-29436-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1534433277-29436-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA4LjE4IGF0IDE3OjI3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQSBudW1iZXIgb2YgY29ybmVyIGNhc2VzIChtb3N0IG9idmlvdXNseSwgbm8tcmVhbC1t
b2RlIGFuZCBubyBNdWx0aWJvb3QgbWVtb3J5Cj4gbWFwKSBjYW4gZW5kIHVwIHdpdGggZTgyMF9y
YXcubnJfbWFwIGJlaW5nIDAsIGF0IHdoaWNoIHBvaW50IHRoZSBMMVRGCj4gY2FsY3VsYXRpb24g
d2lsbCB1bmRlcmZsb3cuCj4gCj4gU3BvdHRlZCBieSBDb3Zlcml0eS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
