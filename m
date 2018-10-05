From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/2] x86/SVM-IOMMU: Don't opencode memcpy()
 in queue_iommu_command()
Date: Fri, 5 Oct 2018 10:22:09 +0200
Message-ID: <20181005082209.6ykeee54ft4jluhs@mac.bytemobile.com>
References: <1537786530-4625-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1537786530-4625-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBTZXAgMjQsIDIwMTggYXQgMTE6NTU6MjlBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBJbiBwcmFjdGljZSwgdGhpcyBhbGxvd3MgdGhlIGNvbXBpbGVyIHRvIHJlcGxhY2Ug
dGhlIGxvb3Agd2l0aCBhIHBhaXIgb2YgbW92cy4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
