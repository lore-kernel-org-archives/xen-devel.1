Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D859BC5518F
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 14:27:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382214.1625581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrG75-0001N6-Ci; Tue, 04 Aug 2026 14:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382214.1625581; Tue, 04 Aug 2026 14:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrG75-0001My-9C; Tue, 04 Aug 2026 14:27:27 +0000
Received: by outflank-mailman (input) for mailman id 1382214;
 Tue, 04 Aug 2026 14:27:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wrG73-0001Ms-W0
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 14:27:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrG72-00Bvym-Fx
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 16:27:24 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a71f6c0-5cb7-0a2a0a5109dd-0a2a4504d054-40
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 16:27:23 +0200
Received: from [52.101.52.70]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a71f6ca-b57f-0a2a45040019-3465344686da-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 16:27:23 +0200
Received: from BLAP220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::9)
 by DM6PR12MB4217.namprd12.prod.outlook.com (2603:10b6:5:219::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 14:27:19 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::84) by BLAP220CA0004.outlook.office365.com
 (2603:10b6:208:32c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Tue, 4
 Aug 2026 14:27:19 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 14:27:19 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 4 Aug
 2026 09:27:19 -0500
Received: from [172.19.79.34] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 4 Aug 2026 09:27:18 -0500
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdejiW88sNJhAhZbXKWD0EyYZGNDAcuFlEfel4t62wJgjJ5gAu3tjUxfQjiluWWqUuIYdQzdBuuIpm5MXADKCQ+eWeNGCYw+VnoRLU2faqh4jJGur8Kh8Fps5o/HbKYonR0LdlwaVZzKsKEdVe1E8MLBNF2hEdFqPWPh3i1p1I055Me0nk1k8sYw7J92eiwWDlmGK3NNkgClV+vqFIY/TLyDCusNwlpsRPdx0hg4zgsJvjMrHINnWBOpl0H2g587sDqbIddFVVRG9SYQ6uZqm2+ckjLymP0uEvcOfgeXyaLftkqY82EXzYr/ftC9Pwg1t8vI5T2lnVBRpsmfVoeCEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nR4Is8OyR6I08GeGM3t3zaSmggdBeboOOSXRsCXiuVk=;
 b=NtR4D2chpsbSQNxJQIVU2OnNc6q7AAzDkyL7XMYVTj4XEmvpWE5AcMlT19WboYKnUWSf3xKi0fMgzjMIeAWszu18NR8GXd7K6zjJLXZ4Ul1dXel+JUPu2Rpxj1JndVMjVjNk8kcU4FmhkRSLr6w23eIQXgEjMmYZRrMD6oF84rS57edea8GK9WYU56y+Tghw+7zZ4Zmj0pBq+9V4aXXWZUCwzOdHYQMiJZNkts6i5Mzu2xGOOuL80xFCoc7yAr9y4sfckhlHxBpfBvspxBx+XSDIejFwS3nS5s4uKr0rGv9HIu9jZxP5IMJna8FD+MxoG/nVx7h2W831iUukVQfW3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nR4Is8OyR6I08GeGM3t3zaSmggdBeboOOSXRsCXiuVk=;
 b=vHikyjsjeR3BqxkivlzyWm4/uVVwGdnxTqPo9MC+VXy2wEZoWvkeT6sQKGpYfTLLBaWElJ1jogP255iNb3jsGVE2QiX94VAN7r91D5XFZyH5UvDs6FMT2MUWm7gLPKiZBHvBm/eyWFlhlUbjgadOWSsGrzZW3Oa9yA7XCKj98sc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <57bb7281-5898-4243-837a-1236b25e761e@amd.com>
Date: Tue, 4 Aug 2026 10:27:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] XSM: make Argo hooks well-formed ones
To: Jan Beulich <jbeulich@suse.com>
CC: Daniel Smith <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <4bd4e7f7-e005-45b4-a543-98597a9de707@suse.com>
 <bbc2fb48-d79e-4f00-81b4-0170dd910aaa@amd.com>
 <8097d8e8-42ec-463a-8247-56c9e4d834cd@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <8097d8e8-42ec-463a-8247-56c9e4d834cd@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|DM6PR12MB4217:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2c43c3-4fbc-4524-3cc8-08def2347de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Gb+sXQlU8KCyB1mqweNeyt/qVLzsprrW7ckV3dZ4Rk54zeQBqjRzvkYZ5ovxHl0K2kb66SbZ08ewI3VJOq9KZFuAX2hXWxo/R7iOOu8iemw3uTstmAbfNLhoZd6TF+Kz+yTn+LGpOe5MeQ0/nEJbGwUA+l6riNOF89Ge6jmID3IwOQ3hNa4hU4LJ+tnZc6NFpBSq0rrO9lHOi8LPStD0meqaEGslYSg8EBlgAizNPXJ4VrdBjJmZexb/iMFWSG+UKYUz55AWiw6Ek9utGMWGaCEwMVCRe52InwhI9/SvyjW+qrD70tLkA2tAzR9pT+ahIVC9TOsEAjKV1Bj2PC0O++QBOJDoz1TM0TIA03j+ITDI8rheTYv+RkNfCQVjF6IVlnV/gIC/gk32RF02xD7hmr3yKeNoMQCsm3n8Z7H5/70Oyw4rLdPmYQmh/ggHJ1GCAcoZxb9V7etuSdFo4Z/2tz94zz8t0VmhlBa3ZvSCXexyEsXK4WWguzNVZQHq1UysfAZrbSEHBiSasyk/keU1QvXEOTaAt4eFFuD1DYrjYqcXXSEpwY7k9LKZb71Guok2q8P0M2EuF+85evkFvMkPYMCA12Qo6hoJnirP6OUTL+Whh+nIktll/PfHfSh9D15OhtwiiKpgqvOAW2eBAxHJOFML99ydPCowGYM3g5vXVSmlyscQO9gGHeohnhN0Kr1SQmug2Xl5ln0nn93KMbW5Iw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5GY+wQCayyJvmwVn4l5h/PIAoNhagbDpleGfOu/s/REXN4AwNoY1CeV3rB3UGNSDoEDJwOKSWCn0by4yq4I6OOxqUUNpriHUP66NinIWZhF+wk50TNa7qeLwtr3CCuTPgbJ2ZV+0CkwAAcIk7HoHsGXVr5rJXhydvKjIntZC1lMJdhNAN50OGM0iSSmjC9j4fRoiU3WTyAAfeGWpOfWamFgso5yigc/NpshFtAN06XExaPW1xEd222cb231T/FZ6mkAciEgLaOyYhF01zLwPk9z9X/lv9c4g9Pc5f1DC0qg8jRZK8AhzyrY6GfGbmuLaDTb4NIWvQ32+WIlhhAMNrXhOrMNF5CSp315zUxW+0ucIQbCBtvNxz6ZxJ/yUc/7wFNSYvTdxdo3ve9BBrXyPPw6FWtRr6vFbbzJqSrsW29S0Arb/2wTEazhiwEncUb1/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:27:19.7286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2c43c3-4fbc-4524-3cc8-08def2347de7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4217
X-purgate-ID: tlsNG-ebf023/1785853643-514D3B50-7B3FA852/0/0
X-purgate-type: clean
X-purgate-size: 3406

On 2026-08-04 03:53, Jan Beulich wrote:
> On 03.08.2026 23:01, Jason Andryuk wrote:
>> On 2026-07-28 09:22, Jan Beulich wrote:
>>> --- a/xen/include/xsm/dummy.h
>>> +++ b/xen/include/xsm/dummy.h
>>
>>> @@ -751,27 +751,32 @@ static XSM_INLINE int xsm_dm_op(XSM_DEFA
>>>    #endif
>>>    
>>>    #ifdef CONFIG_ARGO
>>> -static XSM_INLINE int xsm_argo_enable(const struct domain *d)
>>> +
>>> +static XSM_INLINE int xsm_argo_enable(XSM_DEFAULT_ARG const struct domain *d)
>>>    {
>>> -    return 0;
>>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>>> +    return xsm_default_action(action, current->domain, d);
>>
>> This one I think should be
>>       return xsm_default_action(action, d, NULL);
>>
>> Usually current is passed in for the check, but for domain_create() ->
>> argo_init() it is the under-construction domain.
> 
> And in that case we want to make sure that current->domain may enable Argo
> for d.

It's not a hook for current to enable for d, but more of a hook "is d 
allowed to use argo."

In the hypercall entry path, it use is clear - "is this domain allowed 
to make argo hypercalls."

In argo_init(), it is more of an optimization.  Only initialize if d is 
allowed to use argo.  I think this use is questionable, but it is the 
current code.

In flask, the source is d, the target is xen_t:
     allow domain_type xen_t:argo enable

So it is not an operation between domains.

>>>    }
>>>    
>>>    static XSM_INLINE int xsm_argo_register_single_source(
>>> -    const struct domain *d, const struct domain *t)
>>> +    XSM_DEFAULT_ARG const struct domain *d, const struct domain *t)
>>>    {
>>> -    return 0;
>>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>>> +    return xsm_default_action(action, d, t);
>>>    }
>>>    
>>>    static XSM_INLINE int xsm_argo_register_any_source(
>>> -    const struct domain *d)
>>> +    XSM_DEFAULT_ARG const struct domain *d)
>>>    {
>>> -    return 0;
>>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>>> +    return xsm_default_action(action, current->domain, d);
>>
>> Similarly:
>>       return xsm_default_action(action, d, NULL);
>>
>> The single call is:
>> xsm_argo_register_any_source(currd);
> 
> There being just a single call puts this on the edge. If there was another
> one not passing current->domain, I think the same argument as above would
> hold here. And the general concept is what I think should matter when
> writing the dummy implementations.

For flask, we have xen as the target again:
     allow domain_type xen_t:argo register_any_source;

... since a wildcard ring doesn't have a known target domain.

>> These argo hooks all pass in their arguments explicitly, so I think we
>> should do that and not use current.  (The send and register hooks could
>> use current, and that could make sense as those map to hypercalls.  But
>> it is correct today with the explicit arguments.)
>>
>> With the changes:
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Thanks, but no - unless I misunderstand how permissions are intended to
> work here, I don't think I can make the changes requested, and hence I
> can't apply the R-b.
Understandable.

It seems to me that the XSM hooks have two styles.  Either implicit args 
(using current) or explicit args.  Today, the argo hooks take explicit 
like the grant hooks for instance.

Regards,
Jason

